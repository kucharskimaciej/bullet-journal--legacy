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
      controller: 'PostsIndexController as ctrl'

    .state 'bullet.writing',
      url: '/posts',
      abstract: yes,
      templateUrl: 'posts/writing/layout.tpl.html'
      controller: 'PostsWritingController as writing'

    .state 'bullet.writing.new',
      url: '/new'
      templateUrl: 'posts/writing/template.tpl.html'
      controller: 'PostsWritingFormController as ctrl'

    .state 'bullet.writing.edit',
      url: '/:postID/edit'
      templateUrl: 'posts/writing/template.tpl.html'
      controller: 'PostsWritingFormController as ctrl'


  $urlRouterProvider.otherwise('/')

  return
