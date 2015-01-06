angular.module('posts')
.service 'PostModelProvider', (Post, $state, Restangular) ->
    vm = @

    afterSubmit = () ->
        #$state.go 'bullet.index'

    vm.get = ->
        if $state.params.postID
            Restangular.one('posts', $state.params.postID).get().then (post) ->
                vm.post = post
        else
            vm.post = Post.one()

    vm.save = ->
        vm.post.put()
            .then (post) -> angular.extend(vm.post, post)

    return