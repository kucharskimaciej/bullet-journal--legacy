angular.module('navigation')
.run ($rootScope) ->
    $rootScope.mainNavigationItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'writing.new'
    ,
        name: 'Home',
        icon: 'bars'
        sref: 'posts'
    ]
