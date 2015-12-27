Polymer
  is: "dropbox-file"

  behaviors: [window.DropboxItemBehavior]

  hostAttributes:
    contenteditable: true

  properties:
    _data:
      notify: yes
      type: String

    ### If true, automatically performs fetch of your element ###
    auto:
      observer: "_observeAuto"
      type: Boolean
    arrayBuffer:
      reflectToAttribute: yes
      type: Boolean
    blob:
      reflectToAttribute: yes
      type: Boolean

  _observeAuto: (auto) ->
    if auto
      @$.content.addEventListener "input", @save
    else
      @$.content.removeEventListener "input", @save

  ### Read data from Dropbox File ###
  fetch: ->
    @execute -> @instance.readFile @path, (error, @_data) =>
      @fire "error", error if error?

  ready: ->
    @fetch() if @auto

  ### Synchronize Dropbox File ###
  save: ->
    @execute -> @instance.writeFile @path, @$.content.textContent, (error) =>
      @fire "error", error if error?
