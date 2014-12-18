angular.module('posts')
.directive 'singlePost', ->
    scope:
        post: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'posts/single_directive.tpl.html'

