angular.module('posts')
.service 'PostModelProvider', (Post, Posts, $state) ->
    vm = @

    afterSubmit = () ->
        $state.go 'bullet.index'

    vm.get = ->
        if $state.params.postID
            if Posts.$collection.models
                vm.post = Posts.get($state.params.postID)
            else
                Posts.fetch().then ->
                    vm.post = Posts.get($state.params.postID)
        else
            vm.post = Posts.one()

    vm.save = ->
        Posts.save(vm.post)
            .then (post) ->
                vm.post.content = post.content
            .then afterSubmit

    return