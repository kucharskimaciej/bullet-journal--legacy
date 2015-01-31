angular.module 'common'
.factory 'debounce', ($timeout) ->

    return (callback, interval) ->
        timeout = null

        return ->
            $timeout.cancel timeout
            timeout = $timeout callback, interval