angular.module 'ui.form'
.directive 'uiFormValidation', ($compile) ->
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attrs, ctrl) ->
        validations = scope.$eval(attrs.uiFormValidation)
        element.removeAttr('ui-form-validation')

        for key, val of validations
            element.attr key, if _.isArray(val) then val[0] else val

        $compile(element)(scope)


