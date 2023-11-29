# Component.Update()

This method is called once per call to [World.Update](World_Update.md).

## Syntax

```csharp
void Update()
```

## Remarks

You can override this method to add your own custom behavior that is updated each frame. The base Update method only removes the component from the update list, so there is no need to call it yourself. In other words, don't do this:

```csharp
void MyComponent.Update()
{
  Component.Update();
}
```