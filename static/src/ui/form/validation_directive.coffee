angular.module 'ui.form'
.directive 'uiFormValidation', ($compile) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl) ->
        validations = scope.$eval(attrs.uiFormValidation)
        element.removeAttr('uiFormValidation')
        element.attr(key, val) for key, val of validations

        $compile(element)(scope)

