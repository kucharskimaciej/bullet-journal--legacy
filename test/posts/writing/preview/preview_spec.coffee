describe "PostWritingPreviewController", ->

    beforeEach module('posts')
    beforeEach inject ($controller, $rootScope) ->

        @scope = $rootScope.$new()
        @scope.model =
            attributes:
                original_content: ''

        @MarkdownMock =
            render: jasmine.createSpy().and.returnValue('result')

        @controller = $controller 'PostWritingPreviewController',
            $scope: @scope
            MarkdownRenderer: @MarkdownMock

        $rootScope.$digest()


    describe '#toggle', ->
        it 'exposes isOpen property', ->
            expect @controller.isOpen
                .toBeDefined()

        it 'toggles the value of isOpen when called', ->
            @controller.isOpen = yes

            @controller.toggle()
            expect @controller.isOpen
                .toBe no

            @controller.toggle()
            expect @controller.isOpen
            .toBe yes


    describe '#render', ->
        it 'calls render using MarkdownRenderer when value has changed', ->
            @controller.render('test1', 'test2')

            expect @MarkdownMock.render
                .toHaveBeenCalled()

        it "doesn't call MarkdownRenderer's render when value did not change", ->
            @controller.render('old', 'old')

            expect @MarkdownMock.render
                .not.toHaveBeenCalled()

        it "calls MarkdownRenderer's render with the new value", ->
            @controller.render('new', 'old')

            expect @MarkdownMock.render
            .toHaveBeenCalledWith('new')


        it 'assigns result of renering to rendered property on VM', ->
            @controller.render('test1', 'test2')

            expect @controller.rendered
                .toBe 'result'

        it 'gets called when model.attributes.original_content changes', ->
            @controller.$scope.model.attributes.original_content = 'newContent'
            @controller.$scope.$digest()

            expect @MarkdownMock.render
                .toHaveBeenCalledWith('newContent')