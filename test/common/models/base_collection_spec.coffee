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
