describe "app sanity", ->

  beforeEach module('app') # it loads modules

  it "is sane", ->
    expect(true).toBe(true)

  describe "nested", () ->
    it "", () ->
      expect true
          .toBe true