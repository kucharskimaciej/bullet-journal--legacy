angular.module 'common.navigation'
.directive 'navigationBar', ->
    scope:
        items: '='
    restrict: 'E'
    replace: yes
    templateUrl: 'common/navigation/navbar_directive.tpl.html'
