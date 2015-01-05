angular.module 'common.models.post'
.provider 'Post', ($sceProvider) ->
    configFn = (configurer) ->
        configurer.addElementTransformer 'posts', false, (post) ->
            console.log('transformer')
            post.created_at = new Date(post.created_at)
            post

        configurer.addRequestInterceptor (post, operation) ->
            console.log('req inter', arguments)
            post


    @$get = (Restangular) ->
        Restangular.withConfig configFn
        .service 'posts'


    return


