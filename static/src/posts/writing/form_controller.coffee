angular.module('posts')
.controller 'PostsWritingFormController', (PostModelProvider) ->


    PostModelProvider.get()

    @data = PostModelProvider.data
    @onSubmit = PostModelProvider.onSubmit



