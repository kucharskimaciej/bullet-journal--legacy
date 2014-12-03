angular.module 'common.models.post'
  .provider 'Post', ->
    configFn = (configurer) ->
      configurer.addElementTransformer 'posts', false, (post) ->
        post.created_at = new Date(post.created_at)

        post


    @$get = (Restangular) ->
      Restangular.withConfig configFn
        .service 'posts'


    return


