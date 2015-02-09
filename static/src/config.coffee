app = angular.module('app')

app.config ( RestangularProvider ) ->
  RestangularProvider.setBaseUrl window.api
  RestangularProvider.setRestangularFields id: '_id'
  RestangularProvider.setDefaultHttpFields cache: no

app.run ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams