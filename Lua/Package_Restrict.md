# Package:Restrict

This method enables extra security measures for any loaded package.

## Syntax

- **Restrict**()

## Remarks

This method will prevent any script from directly accessing password-protected package files. The functions [ReadFile](ReadFile.md), [Package::ReadFile](Package_ReadFile.md), and [Package::ExtractFile](Package_ExtractFile.md) will return null or false under these circumstances.
