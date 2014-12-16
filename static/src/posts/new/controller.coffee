angular.module('posts')
.controller 'PostsNewController', ($scope, Post) ->
    $scope.post = {}
    $scope.onSubmit = (isValid, data) ->
        if isValid
            Post.post(data).then ->
                $scope.post = {}


