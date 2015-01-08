class BaseModel

    constructor: (@attributes = {}) ->
        return

    isClean: ->
        !@attributes.fromServer

    save: ->
        promise = if @isClean() then @$Resource.post(@attributes) else @attributes.save()
        promise.then (res) =>
            @attributes = res
            res

        if @isClean() and @collection
            promise.then (res) =>
                @collection.add @, yes
                @

        promise

    fetch: ->
        $Resource = @$Resource or @collection?.$Resource
        idAttr = @idAttr or @collection?.idAttr

        if idAttr and $Resource
            @$Resource.one(@attributes[idAttr]).get().then (res) =>
                @attributes = res
                res

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

    fetch: (options) ->
        options = _.extend {}, @defaultFetchOptions, options

        if @$Resource and (@isClean or options.reset)
            return @$Resource.getList().then (models) =>
                @add(model) for model in models
                @isClean = no

        return @models

    getOne: (id) ->
        for model in @models
            return model if model.attributes?[@idAttr] is id

    remove: (model) ->
        idx = @models.indexOf(model)
        @models.splice(idx, 1) if idx >= 0

        unless model.isClean()
            delete @models[model.attributes[@idAttr]]

        return idx >= 0

    add: (model, atStart = no) ->
        if model.attributes?[@idAttr] and @models[model.attributes[@idAttr]]
            _.extend @models[model.attributes[@idAttr]], model
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

    _setCollectionProperty: (model) ->
        Object.defineProperty model, 'collection', enumerable: no, value: @


angular.module 'common.models.base'
.factory 'BaseModel', ->
    BaseModel
.factory 'BaseCollection', (BaseModel) ->
    BaseCollection::modelClass = BaseModel
    BaseCollection