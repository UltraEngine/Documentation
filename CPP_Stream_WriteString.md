# Stream::WriteString #
This method writes a string to the stream at the current position.

## Syntax ##
- void **WriteString**(const [WString](WString.md)& s, const bool terminate = true)

### Parameters ###
| Name | Description |
|---|---|
| s | string to write |
| terminate | if true an extra byte with a value of zero will be written at the end of the string |
