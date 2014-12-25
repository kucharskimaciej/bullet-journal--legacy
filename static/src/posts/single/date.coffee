angular.module('posts')
.directive 'postDate', ->
  scope: true
  restrict: 'E'
  replace: yes
  templateUrl: 'posts/single/date.tpl.html'
  link: (scope) ->
    days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

    scope.date =
      weekday: days[scope.post.created_at.getDay()]
      day: scope.post.created_at.getDate()
      month: months[scope.post.created_at.getMonth()]




