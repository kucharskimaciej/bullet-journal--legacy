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

  describe "dayInMonth filter", ->
    beforeEach ->
      @dayInMonth = $filter('dayInMonth')


    it "returns empty string when passed no date", () ->
      expect @dayInMonth()
      .toBe ""

    it "returns a day in month", () ->
      days = [25, 26, 27, 28, 29, 30, 31]
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
        expect @dayInMonth(date)
            .toBe days[idx]


  describe "monthName filter", ->
    beforeEach ->
      @monthName = $filter('monthName')


    it "returns empty string when passed no date", () ->
      expect @monthName()
        .toBe ""


    it "returns correct monthname for all months", ->
      months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
      dates = (new Date(2015, mnth, 15) for mnth in [0..11])
      for date, idx in dates
        expect @monthName(date)
          .toBe months[idx]

  describe "year filter", () ->
    beforeEach ->
      @year = $filter('year')

    it "returns empty string when passed no date", () ->
      expect @year()
      .toBe ""

    it "returns correct year", () ->
      years = [1999, 2000, 2001, 2003, 2015, 2035]
      dates = (new Date(year, 0, 12) for year in years)

      for date, idx in dates
        expect @year(date)
        .toBe years[idx]