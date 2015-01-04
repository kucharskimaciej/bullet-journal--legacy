app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->


  $stateProvider
    .state 'bullet',
      url: '',
      abstract: yes
      templateUrl: 'layout/layout.tpl.html'

    .state 'bullet.index',
      url: '/'
      templateUrl: 'posts/index/template.tpl.html'
      controller: 'PostsIndexController'

    .state 'bullet.writing',
      url: '/posts',
      abstract: yes,
      templateUrl: 'posts/writing/layout.tpl.html'
      controller: 'PostsWritingController'

    .state 'bullet.writing.new',
      url: '/new'
      templateUrl: 'posts/writing/template.tpl.html'


    .state 'bullet.writing.edit',
      url: '/:postID/edit'
      templateUrl: 'posts/writing/template.tpl.html'


  $urlRouterProvider.otherwise('/')

  return
