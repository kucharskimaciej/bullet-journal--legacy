app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state 'posts',
      url: '/'
      templateUrl: 'posts/index/template.html'
      controller: 'PostsIndexController'
      controllerAs: 'ctrl'

  return
