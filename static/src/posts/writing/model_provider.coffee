angular.module('posts')
.service 'PostModelProvider', (Post, $state) ->
    vm = @

    afterSubmit = ->
        #$state.go 'bullet.index'

    get = ->
        if $state.params.postID
            Post.one($state.params.postID).get().then (post) ->
                vm.post = post
        else
            vm.post = Post.one()

    { afterSubmit, get, vm }