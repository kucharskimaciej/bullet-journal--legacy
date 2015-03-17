angular.module 'ui.form'
.directive 'uiFormValidationMessages', () ->
    restrict: 'E'
    replace: yes
    templateUrl: 'ui/form/validation_messages_directive.tpl.html'
    scope:
      'forField': '='
      'validationMessages': '@'
    link: (scope, element, attr) ->
      validations = scope.$eval(attrs.validationMessages)