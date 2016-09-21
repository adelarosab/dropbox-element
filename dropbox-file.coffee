Polymer
  is: "dropbox-file"

  behaviors: [window.DropboxItemBehavior]

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
    @obs ?= new MutationObserver @save.bind this
    nodes = (Polymer.dom (this.$$ "content")).getDistributedNodes()

    if auto and @hasContent and nodes?
      @obs.observe nodes[0], { attributes: true, childList: true, characterData: true }
    else
      @obs.disconnect()

  attached: ->
    @hasContent = yes
    @_observeAuto yes

  ### Read data from Dropbox File ###
  fetch: ->
    @execute -> @instance.readFile @path, (error, @_data) =>
      @fire "error", error if error?

  ready: ->
    @fetch() if @auto

  ### Synchronize Dropbox File ###
  save: ->
    @execute -> @instance.writeFile @path, @textContent, (error) =>
      @fire "error", error if error?
