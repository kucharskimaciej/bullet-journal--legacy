describe "directive: post-date", ->

    beforeEach module('app')
    beforeEach inject ($rootScope, $compile) ->
        @scope = $rootScope.$new()
        @scope.date = new Date(2015, 0, 25) # Sun 25tg January

        el = "<post-date date='date'></post-date>"

        @element = $compile(el)(@scope)

        @scope.$digest()


    it "creates isolate scope with the date", ->
        expect @element.isolateScope().date
            .toBe @scope.date

    it "should display a weekday", ->
        expect /Sun/.test(@element.html())
            .toBe true

    it "should display a day no.", ->
        expect /25/.test(@element.html())
            .toBe true

    it "should display a month name", ->
        expect /Jan/.test(@element.html())
            .toBe true

    it "should display a year", ->
        console.log @element.html()
        expect /2015/.test(@element.html())
            .toBe true