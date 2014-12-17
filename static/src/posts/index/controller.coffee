angular.module('posts')
.controller 'PostsIndexController', ($scope, Post) ->
    $scope.posts = Post.getList().$object
    $scope.deletePost = (id) ->
        $scope.posts = $scope.posts.filter (post) -> post._id isnt id

        Post.one(id).remove()
