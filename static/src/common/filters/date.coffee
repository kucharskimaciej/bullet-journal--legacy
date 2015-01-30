convert = (i) ->
  if i instanceof Date then i else new Date(i)

_default = ""

angular.module('common.filters')
.filter 'weekday', ->
  days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
  return (input) ->
    days[convert(input).getDay()] or _default

.filter 'dayInMonth', ->
  return (input) ->
    convert(input).getDate() or _default

.filter 'monthName', ->
  months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
  return (input) ->
    months[convert(input).getMonth()] or _default

.filter 'year', ->
  return (input) ->
    convert(input).getFullYear() or _default