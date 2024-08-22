# Package::Restrict

This method enables extra security measures for any loaded package.

## Syntax

- void **Restrict**()

## Remarks

This method will prevent any script from directly accessing package files. The functions [ReadFile](ReadFile.md), [Package::ReadFile](Package_ReadFile.md), and [Package::ExtractFile](Package_ExtractFile.md) will return null or false under these circumstances.

Once protection is enabled for a package, it cannot be disabled.
