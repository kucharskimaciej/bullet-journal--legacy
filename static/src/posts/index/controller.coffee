angular.module('posts')
.controller 'PostsIndexController', ($scope, Post, Posts) ->
    @vm = Posts.$collection
    Posts.fetch()

    return