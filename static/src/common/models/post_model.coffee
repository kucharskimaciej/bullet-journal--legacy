angular.module 'common.models.post'
.provider 'Post', ($sceProvider) ->
    configFn = (configurer) ->
#        configurer.addElementTransformer 'posts', false, (post) ->
#            post.created_at = new Date(post.created_at)
#            post

        configurer.setDefaultHttpFields cache: false

    @$get = (Restangular) ->
        Restangular.withConfig configFn
        .service 'posts'


    return
