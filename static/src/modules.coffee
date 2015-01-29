angular.module('templates', [])
angular.module('ui.form', [])
angular.module('layout', [])
angular.module('common.navigation', [])
angular.module('common.filters', [])
angular.module('common.directives', [])
angular.module('common.models.base', ['restangular'])
angular.module('common.models.post', ['restangular', 'common.models.base'])
angular.module('common', [
  'common.filters'
  'common.directives'
  'common.models.base'
  'common.models.post'
  'common.navigation'
])

angular.module('posts', ['common.models.post', 'common.filters'])

angular.module 'app', [
  'restangular'
  'ui.router'
  'templates'
  'posts'
  'ui.form'
  'ui.bootstrap'
  'common'
]