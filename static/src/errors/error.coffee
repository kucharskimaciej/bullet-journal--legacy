angular.module('posts')
.controller 'ErrorController', ($state) ->
    @error = $state.current.data.errorType

    return