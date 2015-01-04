angular.module('navigation')
.run ($rootScope) ->
    $rootScope.mainNavigationItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'bullet.writing.new'
    ,
        name: 'Home',
        icon: 'bars'
        sref: 'bullet.index'
    ]
