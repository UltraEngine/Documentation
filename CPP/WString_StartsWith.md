# WString::StartsWith

This method compares the beginning of two wide strings.

## Syntax

bool **StartsWith**(const [WString](WString.md)& beginning)

| Parameter | Description |
|---|---|
| beginning | string to compare |

## Returns

If the left-most characters of this string match the beginning string then true is returned.

If the strings do not match, or if this string is shorter than the beginning string, then false is returned.
