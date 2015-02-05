class BaseModel

    defaults: {}


    constructor: (@attributes = {}) ->
        @_applyDefaults @attributes
        return

    isClean: ->
        !@attributes.fromServer

    save: ->
        promise = if @isClean() then @_getResource().post(@attributes) else @attributes.save()
        if @isClean() and @collection
            promise.then (res) =>
                @collection.add @, yes
                res

        promise.then (res) =>
            @attributes = res
            res

        promise

    fetch: ->
        $Resource = @_getResource()

        if @_getId() and $Resource
            $Resource.one(@_getId()).get().then (res) =>
                @attributes = res
                @_applyDefaults @attributes
                res

    _getIdAttr: -> @idAttr or @collection?.idAttr

    _getId: -> @attributes[@_getIdAttr()]

    _getResource: -> @$Resource or @collection?.$Resource

    _applyDefaults: (attr) ->
        _.defaults attr, @defaults

    destroy: ->
        if @collection
            @collection.remove(@)

        unless @isClean()
            @attributes.remove()

class BaseCollection
    idAttr: '_id'
    defaultFetchOptions:
        reset: false

    constructor: ->
        @models = []
        @isClean = yes

    empty: ->
        return false if @size() is 0
        @models.pop() for model in @models # more speedy than splice
        return true

    fetch: (options) ->
        options = _.extend {}, @defaultFetchOptions, options

        if @$Resource and (@isClean or options.reset)
            return @$Resource.getList().then (models) =>
                console.log models
                @empty()
                @add(model) for model in models
                @isClean = no

        return @models

    getOne: (id) ->
        for model in @models
            return model if model.attributes?[@idAttr] is id
        return null

    remove: (model) ->
        throw new Error('model must be defined') unless model
        throw new Error('model must be instance of collection\'s modelClass') unless model instanceof @modelClass

        idx = @models.indexOf(model)
        @models.splice(idx, 1) if idx >= 0

        unless model.isClean()
            delete @models[model.attributes[@idAttr]]

        return idx >= 0

    add: (model, atStart = no) ->
        if model.attributes?[@idAttr] and @models[model.attributes[@idAttr]]
            _.extend @models[model.attributes[@idAttr]], model, model.defaults
            return

        unless model instanceof @modelClass
            model = new @modelClass(model)

        @_setCollectionProperty(model)
        if atStart
            @models.unshift(model)
        else
            @models.push(model)

        if model.attributes?[@idAttr]
            @models[model.attributes[@idAttr]] = model

        return

    new: (attrs) ->
        model = new @modelClass attrs
        @_setCollectionProperty(model)
        model

    all: -> @models

    size: -> @models.length

    _setCollectionProperty: (model) ->
        Object.defineProperty model, 'collection', enumerable: no, value: @


angular.module 'common.models.base'
.factory 'BaseModel', ->
    BaseModel
.factory 'BaseCollection', (BaseModel) ->
    BaseCollection::modelClass = BaseModel
    BaseCollection