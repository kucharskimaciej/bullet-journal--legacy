angular.module('posts')
.directive 'postContent', ->
    scope:
        htmlContent: '=content'
    restrict: 'E'
    replace: yes
    templateUrl: 'posts/single/content.tpl.html'
