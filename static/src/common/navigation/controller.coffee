angular.module('common.navigation')
  .controller 'CommonNavigationController', ->
    vm = @

    vm.navigationItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'bullet.writing.new'
        primary: yes
      ,
        name: 'Home',
        sref: 'bullet.index'
      ]

    return