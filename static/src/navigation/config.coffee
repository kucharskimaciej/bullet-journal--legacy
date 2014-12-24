angular.module('navigation')
.run ($rootScope) ->
    $rootScope.mainNavigationItems = [
        name: 'Add Post',
        icon: 'plus'
        sref: 'postsNew'
    ,
        name: 'Home',
        icon: 'bars'
        sref: 'posts'
    ]
