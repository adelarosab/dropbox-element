# <dropbox-file>

`dropbox-file` is an element that displays the content of a file inside your 
dropbox account.

```
<dropbox-file
    key="your-app-key"
    path="path/to/your/file.ext">
    This is the content of your file.
</dropbox-file>
```

# <dropbox-dir>

`dropbox-dir` is an element that displays `dropbox-file`s and `dropbox-dir`s 
from a directory inside your dropbox account.

```
<dropbox-dir
    key="your-app-key"
    path="path/to/your/directory">
    <dropbox-file
        key="using-same-app-key"
        path="file/inside/your/dir.ext">
    <dropbox-dir
        key="using-same-app-key"
        path="directory/inside/your/dir.ext">
</dropbox-dir>
```

## Options

`auto` attribute can be provided to `fetch` automatically the content of your 
element.

`share` method retrieve through `url` attribute, the sharing url of your element.
