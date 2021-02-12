# DownloadFile
This function downloads a file from a web server and saves it on the user's hard drive.

## Syntax 
- bool **DownloadFile**(const [WString](WString.md)& src, const [WString](WString.md)& dest)

| Parameter | Description |
|---|---|
| src | URL of the file to download |
| dest | local file path to save to |

## Returns
Returns true if the download succeeds, otherwise false is returned.

## Remarks
Downloaded files are stored in a local cache. You do not need to implement a caching system.
