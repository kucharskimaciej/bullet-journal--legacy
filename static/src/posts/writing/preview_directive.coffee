angular.module 'posts'
.directive 'postPreview',
    scope:
        model: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'posts/writing/preview_directive.tpl.html'
    controller: 'PostPreviewController as preview'

.controller 'PostPreviewController', ->
    @model = model