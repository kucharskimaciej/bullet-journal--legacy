angular.module('posts')
.controller 'PostsWritingController', ($scope, $stateParams, Post) ->
    if $stateParams.postID
        $scope.post = Post.one($stateParams.postID).get().$object
    else
        $scope.post = {}


    $scope.onSubmit = (isValid, data) ->
        if isValid
            Post.post(data).then ->
                $scope.post = {}


