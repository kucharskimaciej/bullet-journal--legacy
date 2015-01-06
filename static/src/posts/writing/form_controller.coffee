angular.module('posts')
.controller 'PostsWritingFormController', (PostModelProvider) ->


    PostModelProvider.get()

    @vm = PostModelProvider
    @onSubmit = (isValid, data) =>
        PostModelProvider.save() if isValid

    return


