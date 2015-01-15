angular.module 'common'
.factory 'debouce', ($timeout) ->

    return (callback, interval) ->
        timeout = null

        return ->
            $timeout.cancel timeout
            timeout = $timeout callback, interval