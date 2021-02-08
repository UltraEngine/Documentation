# String::Split #
This method splits the string by a delimiter and returns an array of parts.

- vector<[String](String.md)\> **Split**(const [String](String.md)& delimiter)

| Parameters | Description |
|---|---|
| delimiter | string separator |

## Returns ##
Returns an array of string parts.

## Remarks ##
If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.
