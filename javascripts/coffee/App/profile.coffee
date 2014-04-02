testResource = /^App\/tests\//
@profile =
  resourceTags:
    test: (filename, mid) ->
      testResource.test(mid)
    amd: (filename, mid) ->
      not testResource.test(mid) and /\.js$/.test(filename)

`profile = this.profile`
