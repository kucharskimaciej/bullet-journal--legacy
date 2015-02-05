describe "Base Collection", () ->
    BaseCollection = null
    BaseModel = null

    beforeEach module('common.models.base')

    beforeEach inject (_BaseCollection_, _BaseModel_) ->
        BaseCollection = _BaseCollection_
        BaseModel = _BaseModel_

    basicSetup = ->
        @collection = new BaseCollection
        @collection.modelClass = BaseModel

        @modelA = new BaseModel(_id: '0')
        @modelB = new BaseModel(_id: '1')

    describe "Basic", () ->

        it "is defined", () ->
            expect BaseCollection
            .toBeDefined()

        it "can be instantinated", () ->
            expect  new BaseCollection instanceof BaseCollection
            .toBe yes


    describe "Models", () ->

        beforeEach basicSetup

        it "creates models collections", () ->
            expect @collection.models
                .toBeDefined()

    describe "#getOne", ->
        beforeEach basicSetup

        it "can get a model by it's id", () ->
            @collection.models.push @modelA
            @collection.models.push @modelB

            expect @collection.getOne @modelA.attributes._id
                .toBe @modelA

        it "returns null if there are no models in collection", ->
            expect @collection.getOne @modelA.attributes._id
                .toBe null

    describe "#empty", ->
        beforeEach basicSetup

        it "returns false if there are no models in collection", ->
            expect @collection.empty()
                .toBe false

        it "removes all elements from collection", ->
            @collection.add @modelA
            @collection.add @modelB

            @collection.empty()

            expect @collection.size()
                .toBe 0

    describe "#size", ->
        beforeEach basicSetup

        it "collection size is 0 at the beginning", ->
            expect @collection.size()
                .toBe 0

        it "returns size of the collection", ->
            @collection.add @modelA
            @collection.add @modelB

            expect @collection.size()
                .toBe 2

        it "collection size is 0 after emptying", ->
            @collection.add @modelA
            @collection.add @modelB
            @collection.empty()
            expect @collection.size()
                .toBe 0


    describe "#new", ->
        beforeEach basicSetup

        it "creates a new model with correct class", ->

            model = @collection.new(_id: 'hello')

            expect model instanceof @collection.modelClass
                .toBe yes

        it "sets model's collection property to itself", ->
            model = @collection.new(_id: 'hello')

            expect model.collection
                .toBe @collection

    describe "#isClean", ->
        beforeEach basicSetup

        it "is clean by default", ->
            expect @collection.isClean
                .toBe yes




    describe "#all", () ->
        beforeEach basicSetup

        it "returns an array", () ->
          expect @collection.all() instanceof Array
              .toBe yes

        it "returned array contains all models", ->
            models = [@modelA, @modelB]

            for model in models
                @collection.add(model)

            expect @collection.all().length
                .toBe models.length

            for model in models
                expect @collection.all().indexOf(model)
                    .not.toBe -1

    describe "#remove", () ->
        beforeEach basicSetup

        it "throws an error unless passed a model", () ->
            expect -> @collection.remove()
                .toThrow()

        it "throws an error if passed object isn't collections modelClass", () ->
            expect -> @collection.remove({})
                .toThrow()

        it "returns false if model is not found in the collection", () ->
            expect @collection.remove(@modelA)
                .toBe false

        it "returns true after sucesful removal", ->
            @collection.add @modelA

            expect @collection.remove @modelA
                .toBe true

        it "removes a model from collection", ->
            @collection.add @modelA
            @collection.remove @modelA

            expect @collection.size()
                .toBe 0

        it "removes just the passed model from collection", () ->
            @collection.add @modelA
            @collection.add @modelB
            @collection.remove @modelA

            expect @collection.size()
                .toBe 1

        it "removes quick reference from collection", ->
            @collection.add @modelA
            @collection.remove @modelA

            expect @collection.models[@modelA._getId()]
                .not.toBeDefined()

        it "works for clean models", ->

            delete @modelA._getId()

            @collection.add @modelA

            expect => @collection.remove @modelA
                .not.toThrow()

    describe "#add", () ->

        beforeEach basicSetup

        it "adds a model to collection", () ->
            @collection.add @modelA

            expect @collection.getOne @modelA._getId()
                .toBe @modelA

        it "creates a quick reference to model if model has an id", () ->
            @collection.add @modelA

            expect @collection.models[@modelA._getId()]
                .toBe @modelA
        it "adds a model that is an instance of collection's modelClass when passed a plain object", () ->
            @collection.add some_prop: 'hello'

            expect @collection.models[0] instanceof @collection.modelClass
                .toBe true

        it "adding a model with same id doesn't duplicate model in collection", () ->
            @collection.add @modelA
            @collection.add @modelA

            expect @collection.size()
                .toBe 1

        it "defines 'collection' property on added model set to the collection", () ->
            @collection.add @modelA

            expect @modelA.collection
                .toBe @collection

        it "when adding a new version of model that's already in collection, merges the two models", ->
            model = _.cloneDeep @modelA

            model.attributes.additionalProperty = true
            @collection.add @modelA
            @collection.add model

            expect @modelA.attributes.additionalProperty
                .toBe true

        it "adds to the end of collection when atStart arg is falsy", () ->
            @collection.add @modelA
            @collection.add @modelB

            expect @collection.models[1]
                .toBe @modelB

        it "add to the beginning of collection when atStart arg is truthy", () ->

            @collection.add @modelA
            @collection.add @modelB, yes

            expect @collection.models[0]
                .toBe @modelB

