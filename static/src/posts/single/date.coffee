angular.module('posts')
.directive 'postDate', ->
  scope: {
    dateModel: "=date"
  }
  restrict: 'E'
  replace: yes
  templateUrl: 'posts/single/date.tpl.html'
  link: (scope) ->
    days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

    scope.date =
      weekday: days[scope.dateModel.getDay()]
      day: scope.dateModel.getDate()
      month: months[scope.dateModel.getMonth()]
      year: scope.dateModel.getFullYear()




