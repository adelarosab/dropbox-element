DropboxItemBehaviorImpl =
  properties:
    ### If true, automatically performs fetch of your element ###
    auto: Boolean
    ### Path of your file inside your Dropbox Account ###
    path:
      reflectToAttribute: yes
      type: String
    ### If you used share method you'll received into this attribute your sharing
    url ###
    url:
      notify: yes
      type: String

  ### Share your file among internet ###
  share: (options = {}) ->
    @instance.makeUrl @path, options, (error, response) ->
      if error?
        @fire "error", error
      else
        @url = response.url

window.DropboxItemBehavior = [window.DropboxAuthBehavior, DropboxItemBehaviorImpl]
