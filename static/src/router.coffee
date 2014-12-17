app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->


  $stateProvider
    .state 'posts',
      url: '/'
      templateUrl: 'posts/index/template.tpl.html'
      controller: 'PostsIndexController'

    .state 'postsNew',
      url: '/posts/new'
      templateUrl: 'posts/create_update/template.tpl.html'
      controller: 'PostsCreateUpdateController'

    .state 'postsEdit',
      url: '/posts/:postID/edit'
      templateUrl: 'posts/create_update/template.tpl.html'
      controller: 'PostsCreateUpdateController'

  $urlRouterProvider.otherwise('/')

  return
