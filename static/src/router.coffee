app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->


  $stateProvider
    .state 'posts',
      url: '/'
      templateUrl: 'posts/index/template.tpl.html'
      controller: 'PostsIndexController'

    .state 'postsNew',
      url: '/posts/new'
      templateUrl: 'posts/new/template.tpl.html'
      controller: 'PostsNewController'

  $urlRouterProvider.otherwise('/')

  return
