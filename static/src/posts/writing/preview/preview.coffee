class PostWritingPreviewController

    constructor: ($scope, MarkdownRenderer) ->
        @$scope = $scope
        @MarkdownRenderer = MarkdownRenderer
        @post = $scope.model
        @rendered = ""

        $scope.$watch 'model.attributes.original_content', @render
        return

    isOpen: yes

    toggle: -> @isOpen = not @isOpen

    render: (newVal, oldVal) =>
        if newVal isnt oldVal
            @rendered = @MarkdownRenderer.render(newVal) or ""


angular.module 'posts'
.controller 'PostWritingPreviewController', PostWritingPreviewController
.directive 'postWritingPreview', ->
    scope:
        model: '='
    restrict: 'E'
    templateUrl: 'posts/writing/preview/preview.tpl.html'
    controller: 'PostWritingPreviewController'
    controllerAs: 'preview'



