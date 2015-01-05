angular.module('posts')
.controller 'PostsWritingController', (PostModelProvider) ->
    @data = PostModelProvider.vm

    return