angular.module('posts')
.controller 'PostsIndexController', ($scope, Post) ->
    Post.getList().then (posts) ->
        $scope.posts = posts
        console.log($scope.posts)
