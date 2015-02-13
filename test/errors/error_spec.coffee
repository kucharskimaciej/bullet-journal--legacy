describe "ErrorController", () ->
  mockState =
    current:
      data:
        errorType: 404

  beforeEach module('app')
  beforeEach inject ($controller, $location, $rootScope) ->
    @$location = $location
    @$scope = $rootScope.$new()

    @ctrl = $controller('ErrorController', $scope: @$scope, $location: @$location, $state: mockState)

    @$scope.$digest()

  it "sets error type to whatever comes from state", ->
    expect @ctrl.error
        .toBe mockState.current.data.errorType
