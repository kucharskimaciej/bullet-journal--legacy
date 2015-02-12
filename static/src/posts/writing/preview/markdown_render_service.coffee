class MarkdownRenderer
    constructor: () ->
        @marked = window.marked
        @_prepareRenderer()
        return

    _prepareRenderer: ->
        @renderer = new @marked.Renderer

        _originalHeadingFn = @renderer.heading

        @renderer.heading = (text, level, raw) ->
            _originalHeadingFn.call @, text, level + 1, raw


    render: (content) => @marked(content, renderer: @renderer)


angular.module 'posts'
.service 'MarkdownRenderer', MarkdownRenderer


