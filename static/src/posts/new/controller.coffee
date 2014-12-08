angular.module('posts')
  .controller 'PostsNewController', ($scope, Post) ->
    $scope.post = {}
    console.log('hi')
    $scope.onSubmit = (isValid, data) ->
      Post.post(data) if isValid


