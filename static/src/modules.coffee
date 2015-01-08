angular.module('templates', [])
angular.module('navigation', [])
angular.module('ui.form', [])
angular.module('common.filters', [])
angular.module('common.models.base', ['restangular'])
angular.module('common.models.post', ['restangular', 'common.models.base'])
angular.module('posts', ['common.models.post', 'common.filters'])

angular.module 'app', [
  'restangular'
  'ui.router'
  'templates'
  'navigation'
  'posts'
  'ui.form'
  'ui.bootstrap'
]