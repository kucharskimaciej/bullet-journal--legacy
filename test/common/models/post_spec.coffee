describe "Posts", () ->
    PostsCollection = null
    postsCollection = null
    PostModel = null
    PostResource = null

    beforeEach module('common.models.post')

    beforeEach inject (_Posts_, _Post_) ->
        postsCollection = _Posts_
        PostsCollection = _Posts_.constructor
        PostModel = PostsCollection::modelClass
        PostResource = _Post_


    basicSetup = ->
        @collection = new PostsCollection
        @model = new PostModel

        @models = [
            new PostModel(_id: 0)
            new PostModel(_id: 1)
            new PostModel(_id: 2)
            new PostModel(_id: 3)
        ]


    describe "definitions", ->
        beforeEach basicSetup

        it "collection is defined", ->
            expect @collection
                .toBeDefined()

        it "model is defined", ->
            expect @model
                .toBeDefined()

        it "collection specifies resource to be Post Resource", ->
            expect @collection.$Resource
                .toBe PostResource

        it "model specifies resource to be Post Resource", ->
            expect @model.$Resource
                .toBe PostResource

    describe "model defaults", ->

        beforeEach basicSetup

        it "specifies default type as 'regular'", ->
            expect PostModel::defaults.type
                .toBe 'regular'

        it "specifies default created_at as date", ->
            expect PostModel::defaults.created_at instanceof Date
                .toBe yes

        it "specifies default created_at as NOW", ->
            expect PostModel::defaults.created_at.getTime()
                .toBeCloseTo (new Date).getTime(), -2 # up to 100ms difference

    describe "factory", ->

        it "returns an instance of PostsCollection", ->
            expect postsCollection instanceof PostsCollection
                .toBe true