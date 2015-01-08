angular.module('posts')
.controller 'PostsWritingFormController', (PostModelProvider) ->
    PostModelProvider.get()

    @vm = PostModelProvider
    @onSubmit = (isValid, data) =>
        @vm.post.save() if isValid

    return


