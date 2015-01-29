angular.module('posts')
.directive 'postDate', ->
  scope: {
    date: "=date"
  }
  restrict: 'E'
  replace: yes
  templateUrl: 'posts/single/date.tpl.html'





