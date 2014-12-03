app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state 'posts',
      url: '/'
      templateUrl: 'posts/index/template.tpl.html'
      controller: 'PostsIndexController'
      controllerAs: 'ctrl'

    .state 'posts.new',
      url: 'posts/new'

  return
