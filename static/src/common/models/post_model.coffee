angular.module 'common.models.post'
.provider 'Post', ->
    configFn = (cfg) ->
        cfg.addElementTransformer 'posts', false, (post) ->
            post.created_at = new Date(post.created_at)
            post

        cfg.addRequestInterceptor (post, operation) ->
            delete post.created_at if operation in ['post', 'put']
            post


    @$get = (Restangular) ->
        Restangular.withConfig configFn
        .service 'posts'

    return

.factory 'Posts', (Post, BaseModel, BaseCollection) ->

    class PostModel extends BaseModel
        $Resource: Post

    class PostsCollection extends BaseCollection
        $Resource: Post
        modelClass: PostModel

    new PostsCollection()