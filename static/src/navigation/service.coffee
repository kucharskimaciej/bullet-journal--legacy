angular.module 'navigation'
  .factory 'NavigationFactory', ->
    navItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'posts.new'
      ,
        name: 'Home',
        icon: 'content'
        sref: 'posts'
    ]

    getNavigationItems = -> navItems

    getNavigationItems: getNavigationItems