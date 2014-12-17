angular.module('posts')
.controller 'PostsCreateUpdateController', ($scope, $stateParams, Post) ->
    if $stateParams.postID
        $scope.post = Post.one($stateParams.postID).get().$object
    else
        $scope.post = {}

    $scope.post =
        title: 'HI'

    $scope.onSubmit = (isValid, data) ->
        console.log(isValid, data, $scope.post)
        if isValid
            Post.post(data).then ->
                $scope.post = {}


