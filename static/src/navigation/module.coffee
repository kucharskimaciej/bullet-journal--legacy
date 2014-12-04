angular.module('navigation')
   .run ($rootScope) ->
      $rootScope.navigationItems = [
          name: 'Add Post',
          icon: 'plus'
          sref: 'posts.new'
        ,
          name: 'Home',
          icon: 'content'
          sref: 'posts'
      ]
