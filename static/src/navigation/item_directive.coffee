angular.module 'navigation'
.directive 'navigationItem', ->
    scope:
        title: '@'
        icon: '@'
        state: '@'
    restrict: 'E'
    require: '^navigationBar'
    replace: yes
    templateUrl: 'navigation/item_directive.tpl.html'