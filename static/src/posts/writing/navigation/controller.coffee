angular.module 'posts'
  .controller 'PostsWritingNavigationController', (PostModelProvider) ->
    vm = @

    vm.submit = ->
      vm.post.submit vm.post.form.$valid

    vm.navigationItems = [
      name: 'Done',
      icon: 'check'
      primary: yes
      action: vm.submit
    ,
      name: 'Back',
      icon: 'chevron-left'
      sref: 'bullet.index'
    ]

    vm.post = PostModelProvider



    return