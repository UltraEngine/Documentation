# Stream::WriteWString #
This method writes a wide string to the stream at the current position.

## Syntax ##
- void **WriteWString**(const [WString](WString.md)& s, const bool terminate = true)

### Parameters ###
| Name | Description |
|---|---|
| s | string to write |
| terminate | if true an extra short with a value of zero will be written at the end of the string |

## Example ##
This example will save a wide string to a UTF-16 encoded text file.

```c++

WString s = L"bla bha sdjfskfhsjfsd";

stream->WriteByte(255);
stream->WriteByte(254);
stream->WriteWString(s, false);

```
