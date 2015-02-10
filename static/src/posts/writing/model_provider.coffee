angular.module('posts')
.service 'PostModelProvider', (Post, Posts, $state) ->
    vm = @

    vm.get = ->
        if $state.params.postID
            if Posts.models.length
                vm.post = Posts.getOne($state.params.postID)
            else
                vm.post = Posts.new(_id: $state.params.postID)
                vm.post.fetch()
        else
            vm.post = Posts.new()

    vm.submit = (isValid) ->
        if isValid
            vm.post.save().then ->
                $state.go('bullet.index')

    return