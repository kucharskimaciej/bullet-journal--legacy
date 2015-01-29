describe "Date filters", ->
  $filter = null


  beforeEach module('app')
  beforeEach inject (_$filter_) ->
    $filter = _$filter_


  describe "weekday filter", ->
    beforeEach ->
      @weekday = $filter('weekday')


    it "returns empty string when passed no date", () ->
      expect @weekday()
          .toBe ""

    it "returns correct day name for all weekdays", () ->
      days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
      dates = [
        new Date(2015, 0, 25)
        new Date(2015, 0, 26)
        new Date(2015, 0, 27)
        new Date(2015, 0, 28)
        new Date(2015, 0, 29)
        new Date(2015, 0, 30)
        new Date(2015, 0, 31)
      ]

      for date, idx in dates
        expect @weekday(date)
            .toBe days[idx]
