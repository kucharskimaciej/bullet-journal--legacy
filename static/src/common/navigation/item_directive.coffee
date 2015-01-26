angular.module 'common.navigation'
.directive 'navigationItem', ->
    scope:
        title: '@'
        icon: '@'
        state: '@?'
        action: '&?'
    restrict: 'E'
    require: '^navigationBar'
    replace: yes
    templateUrl: 'common/navigation/item_directive.tpl.html'
    controller: ($scope) ->
        console.log($scope.action())