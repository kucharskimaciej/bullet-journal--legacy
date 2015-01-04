app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->


  $stateProvider
    .state 'posts',
      url: '/'
      templateUrl: 'posts/index/template.tpl.html'
      controller: 'PostsIndexController'

    .state 'writing',
      url: '/posts',
      abstract: yes,
      templateUrl: 'posts/writing/view.tpl.html'

    .state 'writing.new',
      url: '/new'
      templateUrl: 'posts/writing/template.tpl.html'
      controller: 'PostsWritingController'

    .state 'writing.edit',
      url: '/:postID/edit'
      templateUrl: 'posts/writing/template.tpl.html'
      controller: 'PostsWritingController'

  $urlRouterProvider.otherwise('/')

  return
