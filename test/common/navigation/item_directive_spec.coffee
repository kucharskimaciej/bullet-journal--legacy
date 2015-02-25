describe "directive: navigationItem", () ->
  beforeEach module('app')

  setup = inject ($compile, $rootScope) ->
    @getDirective = (config) ->
      directive =
        element: "<navigation-item config='config'></navigation-item>"
        scope: $rootScope.$new()

      directive.scope.config = config
      directive.compiled = $compile(directive.element)(directive.scope)

      directive.scope.$digest()

      directive


  describe "default behaviour", () ->
    
    beforeEach setup
    beforeEach ->
      @config = name: 'Item name', icon: 'item', sref: 'item.state'
      @dir = @getDirective @config
    
    it "renders with correct sref", () ->
      expect @dir.compiled.attr('ui-sref')
        .toBe @config.sref

    it "renders with correct icon", () ->
      expect new RegExp("fa-#{@config.icon}").test @dir.compiled.html()
        .toBe true

    it "renders with correct item name", () ->
      expect new RegExp(@config.name).test @dir.compiled.html()
        .toBe true
    
  
  describe "custom classes", () ->

    beforeEach setup
    beforeEach ->
      @config = name: 'Item name', icon: 'item', sref: 'item.state', primary: true
      @dir = @getDirective @config

    it "renders with correct button classes depending on primary field in config", () ->
      expect /btn-success/.test @dir.compiled.attr('class')
        .toBe true

  describe "actions", () ->
    beforeEach setup
    beforeEach ->
      @config = name: 'Item name', icon: 'item', sref: 'item.state', action: jasmine.createSpy()
      @dir = @getDirective @config

    it "calls action callback if available", () ->
      @dir.compiled.triggerHandler('click')
      expect(@config.action).toHaveBeenCalled()