describe "PostsIndexController", ->
    beforeEach module('app')
    beforeEach inject ($controller, Posts, $rootScope) ->
        @Posts = Posts
        spyOn(@Posts, 'fetch')

        @controller = $controller('PostsIndexController', Posts: @Posts, $scope: $rootScope.$new())

        $rootScope.$digest()

    it "assigns posts list to the view-model", ->
        expect(@controller.vm).toBe(@Posts.all())

    it "fetches the post list", ->
        expect(@Posts.fetch).toHaveBeenCalled()