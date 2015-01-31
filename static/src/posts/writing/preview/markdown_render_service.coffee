class MarkdownRenderer
    constructor: () ->
        @marked = window.marked
        @_prepareRenderer()
        return

    _prepareRenderer: ->
        @renderer = new @marked.Renderer

        _originalHeadingFn = @renderer.heading

        @renderer.heading = (text, level, raw) ->
            level = 2 if level is 1
            _originalHeadingFn.call @, text, level, raw


    render: (content) => @marked(content, renderer: @renderer)


angular.module 'posts'
.service 'MarkdownRenderer', MarkdownRenderer


