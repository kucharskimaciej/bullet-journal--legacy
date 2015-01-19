angular.module 'ui.form'
.directive 'uiFormField', ->
    scope:
        label: '@?'
        type: '@'
        model: '='
        validates: '@'
    restrict: 'E'
    require: '^ngForm'
    replace: yes
    templateUrl: 'ui/form/field.tpl.html'
    controller: ($scope, $attrs) ->
        if $scope.type is 'select' and $attrs.options
            $scope.options = $scope.$parent.$eval($attrs.options)
            $scope.toggle = (state) -> $scope.model = state