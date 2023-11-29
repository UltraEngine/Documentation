# Sound.GetHandle

This method returns the OpenAL albuffer object associated with this sound.

## Syntax

```csharp
int GetHandle();
```

## Returns

Returns the OpenAL albuffer object.

## Remarks

This feature is intended for advanced programmers. See the [OpenAL documentation](https://openal.org/documentation/) for more information.

### Example

```csharp
int soundHandle = sound.GetHandle();
```

In the above example, the `GetHandle` method is called on a `sound` instance, and the returned handle value is stored in the `soundHandle` variable.