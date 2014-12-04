angular.module 'navigation'
  .directive 'navigationBar', ->
    scope:
      items: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'navigation/navbar_directive.tpl.html'
