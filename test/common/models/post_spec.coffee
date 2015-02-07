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

describe "Post", ->
    Post = null

    beforeEach angular.mock.module("restangular")
    beforeEach module('common.models.post')
    beforeEach inject ($injector) ->
        @Post = $injector.get 'Post'
        @PostModel = $injector.get('Posts').modelClass
        @$httpBackend = $injector.get '$httpBackend'

        @PostModel::idAttr = '_id'

    it "sets created_at attribute to a Date on GET", (done) ->
        @$httpBackend.expectGET("/posts/1").respond( id: '1' )
        @Post.one(1).get().then (post) ->
            expect post.created_at instanceof Date
                .toBe true
            done()

        @$httpBackend.flush()

    it "sets created_at for all posts", (done) ->

        @$httpBackend.expectGET("/posts").respond([{id: 1}, {id: 2}, {id: 3} ])
        @Post.getList().then (posts) ->
            for post in posts
                expect post.created_at instanceof Date
                    .toBe true
            done()
            true

        @$httpBackend.flush()

    it "correctly sets created_at according to server response", (done) ->
        dateString = "October 13, 2014 11:13:00"
        date = new Date(dateString)

        @$httpBackend.expectGET("/posts/1").respond( _id: '1', created_at: dateString )
        @Post.one(1).get().then (post) ->
            expect post.created_at
                .toEqual date
            done()
            true

        @$httpBackend.flush()


    it "deletes created_at attr when POSTing", (done) ->
        post =
            created_at: new Date
            other_attr: "other"

        @$httpBackend.expectPOST "/posts", (data) ->
            data = JSON.parse(data)
            expect data.created_at
                .not.toBeDefined()
            done()
            true

        @Post.post(post)

        @$httpBackend.flush()


    it "deletes created_at attr when PUTing", (done) ->
        post = new @PostModel
            _id: 1


        @$httpBackend.expectGET("/posts/1").respond( _id: '1', created_at: new Date)

        post.fetch()
        @$httpBackend.flush()

        @$httpBackend.expectPUT "/posts/1", (data)->
            data = JSON.parse(data)
            expect data.created_at
                .not.toBeDefined()
            done()

        post.save()

        @$httpBackend.flush()

    it "configs _id to be id field", ->
        post = new @PostModel
            _id: 3
        @$httpBackend.expectGET("/posts/3").respond( _id: '3', created_at: new Date)

        post.fetch()
        @$httpBackend.flush()

        expect post.attributes.getRestangularUrl()
            .toBe "/posts/3"
