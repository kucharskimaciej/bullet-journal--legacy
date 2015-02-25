describe "CommonNavigationController", () ->
    beforeEach module('common.navigation')
    beforeEach inject ($controller, $rootScope) ->
        @controller = $controller 'CommonNavigationController',
            $scope: $rootScope.$new()

        return


    it 'sets up an array of navigation items', ->
        expect(@controller.navigationItems).toEqual(jasmine.any(Array))

    it 'has two items', ->
        expect(@controller.navigationItems.length).toBe(2)