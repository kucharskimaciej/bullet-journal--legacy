angular.module('posts')
.controller 'PostsWritingFormController', (PostModelProvider) ->


    PostModelProvider.get()

    @data = PostModelProvider.vm
    @onSubmit = (isValid, data) ->
        PostModelProvider.save(data) if isValid



    return


