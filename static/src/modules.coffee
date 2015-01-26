angular.module('templates', [])
angular.module('common.navigation', [])
angular.module('ui.form', [])
angular.module('common', [])
angular.module('layout', [])
angular.module('common.filters', [])
angular.module('common.models.base', ['restangular'])
angular.module('common.models.post', ['restangular', 'common.models.base'])
angular.module('posts', ['common.models.post', 'common.filters'])

angular.module 'app', [
  'restangular'
  'ui.router'
  'templates'
  'common.navigation'
  'posts'
  'ui.form'
  'ui.bootstrap'
  'common'
]