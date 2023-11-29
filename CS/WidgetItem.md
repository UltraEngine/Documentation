# WidgetItem

This class contains an item in a listbox or combobox widget.

| Property | Type | Description |
| --- | --- | --- |
| extra | shared_ptr<[Object](Object.md)> | user-defined object |
| icon | shared_ptr<[Icon](Icon.md)> | widget item icon |
| pixmap | shared_ptr<[Pixmap](Pixmap.md)> | widget item pixmap |
| state | WidgetState | widget item state |
| text | readonly [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string?view=net-6.0) | read-only widget item text |
  
```csharp
public class WidgetItem
{
    public shared_ptr<Object> extra;
    public shared_ptr<Icon> icon;
    public shared_ptr<Pixmap> pixmap;
    public WidgetState state;
    public readonly string text;
}
```