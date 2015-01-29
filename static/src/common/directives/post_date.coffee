angular.module('common.directives')
.directive 'postDate', ->
  scope: {
    date: "=date"
  }
  restrict: 'E'
  replace: yes
  templateUrl: 'common/directives/post_date.tpl.html'





