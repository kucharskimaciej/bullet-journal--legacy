angular.module('posts')
.controller 'PostsIndexController', ($scope, Posts) ->
    @vm = Posts.all()
    Posts.fetch(reset: true)

    return