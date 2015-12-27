Polymer
  is: "dropbox-dir"

  behaviors: [window.DropboxItemBehavior]

  properties:
    files:
      notify: yes
      type: Array

  fetch: (options = {}) ->
    @execute ->
      @instance.readdir @path, options, (error, fileNames, folder, @files) =>
        @fire "error", error if error?

  ready: ->
    @fetch() if @auto
