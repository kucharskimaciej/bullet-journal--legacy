angular.module('posts')
.directive 'singlePost', ->
    scope:
        post: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'posts/single/directive.tpl.html'
    controller: (Posts, $scope) ->
        $scope.remove = -> Posts.remove($scope.post)


