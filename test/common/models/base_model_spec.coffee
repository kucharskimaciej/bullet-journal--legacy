describe "Base Model", () ->
  BaseModel = null

  beforeEach module('common.models.base')

  beforeEach inject (_BaseModel_) ->
    BaseModel = _BaseModel_


  describe "Basic", () ->

    it "is defined", () ->
      expect BaseModel
          .toBeDefined()

    it "can be instantinated", () ->
      expect  new BaseModel instanceof BaseModel
          .toBe yes


  describe "#isClean", ->

    it "is true on newly created model", () ->
      model = new BaseModel

      expect model.isClean()
          .toBe yes

    it "is false when the model comes from server /attributes.fromServer is set/", ->
      model = new BaseModel fromServer: yes

      expect model.isClean()
          .toBe false


  describe "#_applyDefaults", () ->

    beforeEach ->
      class @ModelWithDefaults extends BaseModel
        defaults:
          prop1: "from defaults"
          prop2: "from defaults"

    it "fills attributes with default values", () ->
      model = new @ModelWithDefaults

      expect model.attributes.prop1
          .toBeDefined()

    it "doesn't override existing attrs", () ->
      propValue = "from attrs"
      model = new @ModelWithDefaults prop1: propValue

      expect model.attributes.prop1
          .toBe propValue


  describe "#destroy", () ->

    beforeEach ->
      collection = jasmine.createSpyObj 'collection', ['remove']
      attrs = jasmine.createSpyObj 'attrs', ['remove']
      
      @model = new BaseModel attrs
      @model.collection = collection
      
    it "removes element from collection if the element has one", () ->
      @model.destroy()
      expect @model.collection.remove
          .toHaveBeenCalled()

    it "doesn't try to remove from collection if its not defined", () ->
      @model.collection = null
      expect => @model.destroy()
        .not.toThrow()

    it "calls remove on attributes when model is from server", () ->
       @model.attributes.fromServer = yes
       @model.destroy()

       expect @model.attributes.remove
           .toHaveBeenCalled()

    it "doesn't call remove on attrs when model is newly created", () ->
      @model.destroy()

      expect @model.attributes.remove
        .not.toHaveBeenCalled()


  describe "#_getIdAttr", () ->
    beforeEach ->
      @model = new BaseModel

    it "gets the id key from collection if it's defined", () ->
      collection =
        idAttr: 'collectionIdKey'

      @model.collection = collection

      expect @model._getIdAttr()
          .toBe collection.idAttr

    it "gets the id key from model", () ->
      @model.idAttr = 'idKey'

      expect @model._getIdAttr()
          .toBe 'idKey'

    it "returns undefined if idAttr is not present", () ->

      @model.idAttr = 'fakeidkey'
      @model.attributes[@model.idAttr] = 'hello'

      expect @model._getId()
          .toBe @model.attributes[@model.idAttr]
      
  describe "#_getResource", () ->
    beforeEach ->
      @model = new BaseModel
      
    it "gets resource from model.$Resource if available", () ->
      resource = {}
      @model.$Resource = resource

      expect @model._getResource()
          .toBe resource


    it "get resource from model's collection otherwise", () ->
      res = {}
      collection =
        $Resource: res

      @model.collection = collection

      expect @model._getResource()
          .toBe res

  describe "#save", () ->

    beforeEach ->

      response =
        fromServer: yes
        fakeAttr: yes

      @$FakeResource =
        post: (attrs) ->
          return {
            then: (callback) -> callback(response)
          }

      @fakeAttrs =
        save: ->
          return {
            then: (callback) -> callback(response)
          }

      spyOn(@$FakeResource, 'post').and.callThrough()
      spyOn(@fakeAttrs, 'save').and.callThrough()

      @model = new BaseModel
      @model.attributes = @fakeAttrs
      @model.$Resource = @$FakeResource

      @response = response


    it "uses proper $Resource object", ->
      spyOn(@model, '_getResource').and.callThrough()

      @model.save()

      expect @model._getResource
          .toHaveBeenCalled()


    it "calls #post on $Resource if model is newly created", () ->
      @model.save()

      expect @$FakeResource.post
           .toHaveBeenCalled()

    it "calls #save on attributes if model is from server", () ->
      @model.attributes.fromServer = yes
      @model.save()

      expect @$FakeResource.post
          .not.toHaveBeenCalled()

      expect @fakeAttrs.save
          .toHaveBeenCalled()

    it "replaces attributes with server response", () ->
      @model.save()

      expect @model.attributes
          .toBe @response

    it "adds model to collection if collection prop is defined and model is new", () ->
      collection = jasmine.createSpyObj 'collection', ['add']
      @model.collection = collection

      @model.save()

      expect @model.collection.add
          .toHaveBeenCalled()

  describe "#fetch", () ->
    beforeEach ->
      id = 'fakeID'
      response =
        fromServer: yes
        fakeAttr: yes
        idKey: 'fakeID'

      getMock =
        get: ->
          then: (callback) -> callback(response)

      @$FakeResource =
        one: (id) -> getMock


      @model = new BaseModel
      @model.$Resource = @$FakeResource
      @model.idAttr = 'idKey'
      @model.attributes[@model.idAttr] = id

      @response = response
      @getMock = getMock

      spyOn(@$FakeResource, 'one').and.callThrough()
      spyOn(@getMock, 'get').and.callThrough()



    it "uses proper $Resource object", ->
      spyOn(@model, '_getResource').and.callThrough()

      @model.fetch()

      expect @model._getResource
          .toHaveBeenCalled()


    it "does no request if model id is missing", () ->
      delete @model.attributes[@model.idAttr]
      @model.fetch()
      expect @$FakeResource.one
          .not.toHaveBeenCalled()

    it "requests `one` from resource with correct id", () ->
       @model.fetch()
       expect @$FakeResource.one
          .toHaveBeenCalledWith(@model._getId())

    it "makes GET request to server via $Resource:get", () ->
      @model.fetch()

      expect @getMock.get
          .toHaveBeenCalled()

    it "applies defaults to server response", () ->
      spyOn(@model, '_applyDefaults').and.callThrough()

      @model.fetch()

      expect @model._applyDefaults
          .toHaveBeenCalledWith(@response)