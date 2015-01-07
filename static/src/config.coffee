app = angular.module('app')

app.config ( RestangularProvider ) ->
  RestangularProvider.setBaseUrl 'http://localhost:3000'
  RestangularProvider.setRestangularFields id: '_id'
  RestangularProvider.setDefaultHttpFields cache: no

app.run ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams