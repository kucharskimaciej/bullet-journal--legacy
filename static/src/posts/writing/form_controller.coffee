angular.module('posts')
.controller 'PostsWritingFormController', ($scope, PostModelProvider) ->

    PostModelProvider.get()
    @vm = PostModelProvider

    $scope.$watch 'postForm', (form) =>
        @vm.form = form

    @onSubmit = (isValid, data) =>
        console.log('try submit')
        @vm.post.save() if isValid

    return


