angular.module 'common.models.post'
.provider 'Post', ->
    configFn = (cfg) ->
        cfg.addElementTransformer 'posts', false, (post) ->
            post.created_at = new Date(post.created_at)
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

    one = ->
        Post.one()

    save = (model) ->
        model.save().then (post) ->
            unless model.fromServer
                $collection.models.push(model)
            post

    { $collection, fetch, get, one, save }