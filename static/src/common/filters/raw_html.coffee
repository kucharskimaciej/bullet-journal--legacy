angular.module('common.filters')
.filter 'rawHtml', ($sce) ->
    return (val) -> $sce.trustAsHtml val or ''
