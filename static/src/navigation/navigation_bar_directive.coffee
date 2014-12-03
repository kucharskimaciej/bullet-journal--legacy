angular.module 'navigation'
  .directive 'navigationBar', ->
    scope:
      items: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'navigation/navigation_bar_directive.tpl.html'
