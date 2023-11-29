# Entity.GetComponent

## Syntax

- public [Component](Component.md) GetComponent\<T\>()

| Parameter | Description |
|---|---|
| T | type of component |

## Returns

Returns a component if it exists, otherwise null is returned.

**Example**

Here's an example of how to use the `GetComponent` method:

```csharp
Component component = entity.GetComponent<Component>();
if (component != null)
{
    // Do something with the component
}
else
{
    // Component does not exist
}
```