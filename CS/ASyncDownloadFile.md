# ASyncDownloadFile

This function provides a non-blocking method of downloading files for GUI applications.

## Syntax

- [ASyncDownloadFileInfo](ASyncDownloadFileInfo.md) **ASyncDownloadFile**(string url, string localpath)

| Parameter | Description |
|---|---|
| url | remote path to download from |
| localpath | location of the downloaded file |

## Returns

Returns an ASyncDownloadFileInfo object with the following methods available:

- **GetProgress**: This will return a float value between zero and one, indicating the download progress.
- **GetStatus**: This will return DOWNLOAD_FINISHED, DOWNLOAD_FAILED, or DOWNLOAD_INPROGRESS.
- **Cancel**: This will cancel the download if it is still in progress.

## Example

```csharp
ASyncDownloadFileInfo fileInfo = ASyncDownloadFile("http://example.com/file.txt", "C:\\Downloads\\file.txt");

while (fileInfo.GetStatus() == DOWNLOAD_INPROGRESS) {
    float progress = fileInfo.GetProgress();
    Console.WriteLine("Download Progress: " + progress);
    // Do other processing if necessary
}

if (fileInfo.GetStatus() == DOWNLOAD_FINISHED) {
    Console.WriteLine("Download completed successfully!");
} else if (fileInfo.GetStatus() == DOWNLOAD_FAILED) {
    Console.WriteLine("Download failed!");
    // Handle the failure case if necessary
}
```