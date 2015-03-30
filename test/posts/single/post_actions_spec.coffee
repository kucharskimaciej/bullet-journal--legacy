describe "directive: post-date", ->

    beforeEach module('app')
    beforeEach inject ($rootScope, $compile) ->
        @scope = $rootScope.$new()
        @scope.post =
            destroy: jasmine.createSpy()
            _getId: jasmine.createSpy()

        el = "<post-actions post='post'></post-actions>"

        @element = $compile(el)(@scope)

        @scope.$digest()

    describe "#remove", ->
        it "calls post.destroy", ->
            @element.isolateScope().remove()
            expect(@scope.post.destroy).toHaveBeenCalled()

    describe "id", ->
        it "calls getId from post to obtain it's id", ->
            expect(@scope.post._getId).toHaveBeenCalled()

