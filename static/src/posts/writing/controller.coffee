angular.module('posts')
.controller 'PostsWritingController', ($scope, $stateParams, $state, Post) ->

    console.log($stateParams, $state)

    if $state.params.postID
        $scope.post = Post.one($state.params.postID).get().$object
    else
        $scope.post = {}


    $scope.onSubmit = (isValid, data) ->
        if isValid
            Post.post(data).then ->
                $scope.post = {}


