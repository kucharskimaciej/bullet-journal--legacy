describe "Base Collection", () ->
    BaseCollection = null

    beforeEach module('common.models.base')

    beforeEach inject (_BaseCollection_) ->
        BaseCollection = _BaseCollection_


    describe "Basic", () ->

        it "is defined", () ->
            expect BaseCollection
            .toBeDefined()

        it "can be instantinated", () ->
            expect  new BaseCollection instanceof BaseCollection
            .toBe yes