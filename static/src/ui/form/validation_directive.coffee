angular.module 'ui.form'
.directive 'uiFormValidation', ($compile) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl) ->
        validations = scope.$eval(attrs.uiFormValidation)
        input = angular.element(element[0].querySelector('input, textarea, select'))

        input.attr(key, val) for key, val of validations

        $compile(element.contents())(scope)

