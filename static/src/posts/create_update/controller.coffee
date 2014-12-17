angular.module('posts')
.controller 'PostsCreateUpdateController', ($scope, $stateParams, Post) ->

    if $stateParams.postID
        Post.one($stateParams.postID).get().then (post) ->
            $scope.post = post
    else
        $scope.post = {}

    $scope.onSubmit = (isValid, data) ->
        if isValid
            Post.post(data).then ->
                $scope.post = {}


