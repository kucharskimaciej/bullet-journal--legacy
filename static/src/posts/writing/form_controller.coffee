angular.module('posts')
.controller 'PostsWritingFormController', ($scope, $state, PostModelProvider) ->

    PostModelProvider.get()
    @vm = PostModelProvider

    @today = new Date

    @submit = submit = =>
        console.log('shit')
        if $scope.postForm.$valid
            @vm.post.save().then ->
                $state.go('bullet.index')

    @navigationItems = [
        name: 'Done',
        icon: 'check'
        primary: yes
        action: submit
    ,
        name: 'Back',
        icon: 'chevron-left'
        sref: 'bullet.index'
    ]

    return


