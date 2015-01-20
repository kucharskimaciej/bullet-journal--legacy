describe "RawHtml filter", ->
  $filter = null


  beforeEach module('app')
  beforeEach inject (_$filter_) ->
    $filter = _$filter_

  beforeEach ->
    @raw = $filter('rawHtml')


  it "returns empty string when passed null", () ->
    expect @raw(null)
        .toBe ''

  it "returns empty string when passed no value", () ->
    expect @raw()
        .toBe ''

  it "returns an non-escaped html when passed a html string", () ->
    expect @raw("<p>Hello!</p>").$$unwrapTrustedValue()
        .toBe "<p>Hello!</p>"
