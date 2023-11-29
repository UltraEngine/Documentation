# DownloadFile
This function downloads a file from a web server and saves it to the user's hard drive.

## Syntax 
```csharp
bool DownloadFile(string src, string dest)
```

| Parameter | Description |
|---|---|
| src | URL of the file to download |
| dest | local file path to save to |

## Returns
Returns true if the download succeeds, otherwise false is returned.

## Remarks
Downloaded files are stored in a local cache. You do not need to implement an additional caching system.

## Example
```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string src = "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/ultraengine_logo.png";
        string dst = System.Environment.GetFolderPath(System.Environment.SpecialFolder.MyDocuments) + "/temp.png";

        Print("Downloading...");
        if (DownloadFile(src, dst))
        {
            Print("Download complete.");
            RunFile(dst);
        }
        else
        {
            Print("Failed to download file.");
        }
    }
}
```