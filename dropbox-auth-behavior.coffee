window.DropboxAuthBehavior =
  properties:
    ### Instance of the Dropbox.Client using for our requests. ###
    instance: Object
    ### App key obtained from Dropbox Developer Console. https://www.dropbox.com/developers/apps ###
    key:
      observer: "_observeKey"
      reflectToAttribute: yes
      type: String

  _observeKey: (key) ->
    defer = Promise.defer()
    @promise = defer.promise

    @instance = new Dropbox.Client {key}
    @instance.authenticate (error) ->
      if error?
        @fire "error", error
      else
        defer.resolve()

  execute: (cb) ->
    @promise.then cb.bind this
