class PostWritingPreviewController

    constructor: (@$scope, @MarkdownRenderer) ->
        @post = $scope.model
        @rendered = ""

        $scope.$watch 'model.attributes.original_content', @render
        return

    isOpen: yes

    toggle: -> @isOpen = not @isOpen

    render: (newVal, oldVal) =>
        console.log 'calling render with', newVal, oldVal, @$scope.model
        if newVal isnt oldVal
            @rendered = @MarkdownRenderer.render(newVal) or ""


angular.module 'posts'
.directive 'postWritingPreview', ->
    scope:
        model: '='
    restrict: 'E'
    templateUrl: 'posts/writing/preview/preview.tpl.html'
    controller: 'PostWritingPreviewController'
    controllerAs: 'preview'

.controller 'PostWritingPreviewController', PostWritingPreviewController

