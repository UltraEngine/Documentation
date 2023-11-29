# Widget.GetInterface

This method returns the interface the widget was created in.

## Syntax

```csharp
Interface GetInterface()
```

## Returns

Returns the widget interface, or `null` if the interface has gone out of scope and been deleted.

## Example

```csharp
Interface interface = widget.GetInterface();
```