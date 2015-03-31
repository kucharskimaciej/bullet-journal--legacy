describe 'MarkdownRenderer', ->
    beforeEach ->
        window.marked = jasmine.createSpy('marked')

        @headingSpy = jasmine.createSpy('heading')
        @rendererMock = =>
            heading: @headingSpy

        window.marked.Renderer = @rendererMock

        @marked = window.marked

    beforeEach module('posts')
    beforeEach inject (MarkdownRenderer) ->
        @mkd = MarkdownRenderer



    describe '#heading', ->

        it "calls the original marked function with the increased level", ->

            @mkd.renderer.heading('hello', 1, false)

            expect @headingSpy
                .toHaveBeenCalledWith('hello', 2; false)

    describe "#render", ->

        it 'calls marked for rendering', ->
            @mkd.render('test')
            expect @marked
                .toHaveBeenCalled()

        it 'uses the prepared renderer', ->
            @mkd.render('test')
            expect @marked
                .toHaveBeenCalledWith 'test', renderer: @mkd.renderer


