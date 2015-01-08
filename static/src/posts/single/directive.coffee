angular.module('posts')
.directive 'singlePost', ->
    scope:
        post: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'posts/single/directive.tpl.html'
    controller: (Posts, $scope) ->
        $scope.remove = -> $scope.post.destroy()
        $scope.atts = $scope.post.attributes


