angular.module 'common.models.post'
.provider 'Post', ->
    configFn = (cfg) ->
        cfg.addElementTransformer 'posts', false, (post) ->
            post.created_at = new Date(post.created_at)
            post

        cfg.addRequestInterceptor (post, operation) ->
            delete post.created_at if operation in ['post', 'put']
            post

        cfg.extendModel 'posts', (model) ->
            model.isModel = yes

            model

    @$get = (Restangular) ->
        Restangular.withConfig configFn
        .service 'posts'

    return

.factory 'Posts', (Post) ->
    $collection = {}

    $collection.models = []
    $collection.isNew = yes

    fetch = (opts = {}) ->
        if $collection.isNew or opts.reset
            return Post.getList().then (posts) ->
                $collection.models = posts
                $collection.isNew = no
                posts

        return $collection.models

    get = (id) ->
        for post in $collection.models
            return post if post._id is id

    one = -> {}


    save = (model) ->
        console.log '2', model.original_content
        promise = if model.isModel then model.save() else Post.post(model)

        promise.then (post) ->
            angular.extend model, post
            post

        if not model.isModel
            promise.then (post) ->
                $collection.models.unshift post
                post

        promise

    remove = (model) ->
        model.remove().then ->
            idx = $collection.models.indexOf(model)
            if idx >= 0
                $collection.models.splice(idx, 1)

    { $collection, fetch, get, one, save, remove }