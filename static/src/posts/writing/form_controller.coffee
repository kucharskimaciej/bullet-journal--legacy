angular.module('posts')
.controller 'PostsWritingFormController', ($scope, PostModelProvider) ->

    PostModelProvider.get()
    @vm = PostModelProvider

    $scope.$watch 'postForm', (form) =>
        @vm.form = form

    return


