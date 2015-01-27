angular.module('posts')
.controller 'PostsWritingFormController', ($scope, PostModelProvider) ->

    PostModelProvider.get()
    @vm = PostModelProvider

    @today = new Date

    $scope.$watch 'postForm', (form) =>
        @vm.form = form

    return


