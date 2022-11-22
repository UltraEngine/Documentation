# Component::SaveState

This method is called when an actor is saved to a file or copied.

## Syntax

- bool **SaveState**([nlohmann::json](https://json.nlohmann.me/)& j3)

| Parameter | Description |
|---|---|
| j3 | component data in a JSON object |

## Returns

Returns true if the component is successfully saved, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to save some extra information or write to another file.
