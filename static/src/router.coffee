app = angular.module('app')

app.config ($stateProvider, $urlRouterProvider) ->


  $stateProvider
    .state 'bullet',
      url: '',
      abstract: yes
      templateUrl: 'layout/layout.tpl.html'

    .state 'bullet.index',
      url: '/'
      views:
        'navigation':
          templateUrl: 'common/navigation/navigation.tpl.html'
          controller: 'CommonNavigationController as ctrl'

        'main':
          templateUrl: 'posts/index/template.tpl.html'
          controller: 'PostsIndexController as ctrl'


    .state 'bullet.writing',
      url: '/posts',
      abstract: yes,
      views:
        'navigation':
          templateUrl: 'posts/writing/navigation/navigation.tpl.html'
          controller: 'PostsWritingNavigationController as ctrl'

        'main':
          templateUrl: 'posts/writing/layout.tpl.html'
          controller: 'PostsWritingController as ctrl'

    .state 'bullet.writing.new',
      url: '/new'
      views:
        'editor':
          templateUrl: 'posts/writing/template.tpl.html'
          controller: 'PostsWritingFormController as ctrl'

    .state 'bullet.writing.edit',
      url: '/:postID/edit'
      views:
        'editor':
          templateUrl: 'posts/writing/template.tpl.html'
          controller: 'PostsWritingFormController as ctrl'


    .state 'errors',
      abstract: yes,
      templateUrl: 'errors/layout.tpl.html'

    .state 'errors.404',
      templateUrl: 'errors/404.tpl.html'
      controller: 'ErrorController as ctrl'
      data:
        errorType: '404'


  $urlRouterProvider.when('', '/')
  $urlRouterProvider.otherwise ($injector) ->
    return $injector.invoke ($state) ->
      $state.go('errors.404')

  return
