angular.module('templates', [])
angular.module('navigation', [])
angular.module('common.models.post', ['restangular'])
angular.module('posts', ['common.models.post'])

angular.module 'app', [
  'restangular'
  'ui.router'
  'templates'
  'navigation'
  'posts'
]