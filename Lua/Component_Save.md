# Component:Save

This method is called when a component is saved to a file or copied.

## Syntax

- boolean **Save**([table](https://www.lua.org/manual/5.4/manual.html#6.6) properties, [Stream](Stream.md) binstream, [Scene](Scene.md) scene, number flags)

| Parameter | Description |
|---|---|
| properties | component properties |
| binstream | stream of binary data |
| scene | map that is being loaded |
| flags | map save flags |

## Returns

Returns true if the component is successfully saved, otherwise false is returned.
