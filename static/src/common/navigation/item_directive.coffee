angular.module 'common.navigation'
.directive 'navigationItem', ->
    scope:
        config: '='
    restrict: 'E'
    require: '^^?navigationBar'
    replace: yes
    templateUrl: 'common/navigation/item_directive.tpl.html'
    link: (scope, element, attrs) ->
        if scope.config.action
            element.on 'click', (event) ->
                event.preventDefault()
                scope.config.action()
