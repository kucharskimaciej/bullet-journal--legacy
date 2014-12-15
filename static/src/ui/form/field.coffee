angular.module 'ui.form'
  .directive 'uiFormField', ->
    scope:
      label: '@'
      type: '@'
      model: '='
      options: '=?'
    restrict: 'E'
    require: '^ngForm'
    replace: yes
    templateUrl: 'ui/form/field.tpl.html'
    controller: ($scope) ->
