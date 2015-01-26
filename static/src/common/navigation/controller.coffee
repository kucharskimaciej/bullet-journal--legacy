angular.module('common.navigation')
  .controller 'CommonNavigationController', ->
    vm = @

    vm.navigationItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'bullet.writing.new'
      ,
        name: 'Home',
        icon: 'bars'
        sref: 'bullet.index'
      ]

    return