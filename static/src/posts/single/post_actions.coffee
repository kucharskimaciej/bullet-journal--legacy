angular.module('posts')
.directive 'postActions', ->

    replace: yes
    restrict: 'E'
    scope:
        post: '='
    templateUrl: 'posts/single/post_actions.tpl.html'
    link: (scope) ->
        scope.remove = -> scope.post.destroy()
        scope.id = scope.post._getId()

