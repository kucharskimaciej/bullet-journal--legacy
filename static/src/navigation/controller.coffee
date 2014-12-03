angular.module 'navigation'
  .controller 'NavigationController', ($scope, NavigationFactory) ->
    $scope.navigationItems = NavigationFactory.getNavigationItems()