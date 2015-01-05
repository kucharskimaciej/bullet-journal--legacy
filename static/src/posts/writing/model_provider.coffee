angular.module('posts')
.factory 'PostModelProvider', (Post, $state) ->

    data = {}

    onSubmit = (isValid, data) ->
        if isValid
            Post.post(data).then ->
                $state.go('bullet.index')

    get = ->
        if $state.params.postID
            data.post = Post.one($state.params.postID).get().$object
        else
            data.post = {}


    { onSubmit, get, data }