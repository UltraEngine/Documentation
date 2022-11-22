# Component::LoadState

This method is called when an actor is loaded from a file or copied.

## Syntax

- bool **LoadState**([nlohmann::json](https://json.nlohmann.me/)& j3)

| Parameter | Description |
|---|---|
| j3 | component data in a JSON object |

## Returns

Returns true if the component is successfully loaded, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to create extra entities to use.
