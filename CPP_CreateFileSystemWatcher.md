# CreateFileSystemWatcher #
This function can be used to create an object that monitors a specified directory for changes.

## Syntax ##
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const string& path);
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const wstring& path);

### Parameters ###
|Name|Description|
|---|---|
|**path**|path to folder to watch|

## Returns ##
Returns a new FileSystemWatcher object if the specified directory exists, otherwise NULL is returned.

## Remarks ##
Once the FileSystemWatcher object is created, it will monitor the directory to detect changes. When changes occur an event will be emitted. The event ID will be EVENT_FILE_CREATE, EVENT_FILE_DELETE, EVENT_FILE_RENAME, or EVENT_FILE_CHANGE.

## Example ##
```c++

```
