angular.module('navigation')
   .run ($rootScope) ->
      $rootScope.mainNavigationItems = [
          name: 'Add Post',
          icon: 'plus'
          sref: 'posts.new'
        ,
          name: 'Home',
          icon: 'content'
          sref: 'posts'
      ]
