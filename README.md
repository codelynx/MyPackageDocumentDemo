### Overview

I was wondering if SwiftUI is ready for media authoring type of app that handles thousands of tiny and huge media files such as image, sound and video.

### Story

So I wrote some code to make sure if SwiftUI is ready for that type of demands.  Here is the list of my check list.

* iOS, macOS or both app
* Document should be packaged (directory) based, because app should be able to manage thousands of files such as text, image, sound and movie.

Then I start working on a demo project called `MyPackageDocumentDemo`.

Suddenly, I ran into an issue that I don't know how to work around.  `MyPackageDocumentDemo` provide a `MyPackageDocumentAppDocument` which is `FileDocument`, but `FileDocument` provides read and write contents through following methods.

```.swift
init(configuration: ReadConfiguration) throws
```

```.swift
func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper
```

However, from these two method, we cannot read nor write access files under document folder.  You may use `FileWrapper` to handle packaged document, but there is no direct access to the directory.  I know you can work around these issues with `UIDocument` by overriding those methods.


```.swift
override func write(to url: URL, ofType typeName: String) throws
```

```.swift
override func read(from url: URL, ofType typeName: String) throws
```

### Conclusion

SwiftUI is not ready for developing some media rich document apps.

### Environment

- Xcode 12.2.1
- Apple Swift version 5.5.2

### License

MIT License
