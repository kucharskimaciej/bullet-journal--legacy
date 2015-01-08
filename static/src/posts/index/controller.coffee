angular.module('posts')
.controller 'PostsIndexController', ($scope, Posts) ->
    @vm = Posts
    Posts.fetch(reset: true)

    return