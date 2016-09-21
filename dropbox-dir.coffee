Polymer
  is: "dropbox-dir"

  behaviors: [window.DropboxItemBehavior]

  properties:
    ### Array of elements which compose the directory inside our Dropbox Account ###
    files:
      notify: yes
      type: Array

  fetch: (options = {}) ->
    @execute ->
      @instance.readdir @path, options, (error, fileNames, folder, @files) =>
        @fire "error", error if error?

  ready: ->
    @fetch() if @auto
