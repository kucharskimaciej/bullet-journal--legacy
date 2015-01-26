angular.module 'common.navigation'
.directive 'navigationItem', ->
    scope:
        title: '@'
        icon: '@'
        state: '@?'
        item: '='
    restrict: 'E'
    require: '^^?navigationBar'
    replace: yes
    templateUrl: 'common/navigation/item_directive.tpl.html'
    link: (scope, element, attrs) ->
        if scope.item.action
            element.on 'click', (event) ->
                event.preventDefault()
                scope.item.action()
