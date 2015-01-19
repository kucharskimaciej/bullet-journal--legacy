class PostWritingPreviewController

    constructor: (@$scope) ->
        @post = $scope.model
        return

    isOpen: yes

    toggle: -> @isOpen = not @isOpen



angular.module 'posts'
.directive 'postWritingPreview', ->
    scope:
        model: '='
    restrict: 'E'
    templateUrl: 'posts/writing/preview/preview.tpl.html'
    controller: 'PostWritingPreviewController'
    controllerAs: 'preview'

.controller 'PostWritingPreviewController', PostWritingPreviewController

