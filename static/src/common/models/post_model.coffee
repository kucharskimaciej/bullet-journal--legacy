angular.module 'common.models.post'
.provider 'Post', ->
    configFn = (cfg) ->
        cfg.addElementTransformer 'posts', false, (post) ->
            post.created_at = new Date(post.created_at)
            post

        cfg.addRequestInterceptor (post, operation) ->
            delete post.created_at if operation is 'post' or 'put'
            post

    @$get = (Restangular) ->
        Restangular.withConfig configFn
        .service 'posts'


    return

.factory 'Posts', (Post) ->
    $collection = {}

    $collection.models = []

    fetch = (opts = {}) ->
        if not $collection.models.length or opts.reset
            return Post.getList().then (posts) ->
                $collection.models = posts
                posts

        return $collection.models

    get = (id) ->
        for post in $collection.models
            return post if post._id is id

    one = -> Post.one()

    save = (model) ->
        model.save().then (post) ->
            unless model.fromServer
                angular.extend(model, post)
                console.log(model, post)
                $collection.models.unshift(model)
            post

    remove = (model) ->
        model.remove().then ->
            idx = $collection.models.indexOf(model)
            if idx >= 0
                $collection.models.splice(idx, 1)

    { $collection, fetch, get, one, save, remove }