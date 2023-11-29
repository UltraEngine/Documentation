# WString.ToInt

This method converts the wide string into an integer value.

## Syntax

- long **ToInt**()

## Returns

Returns an integer value.

### Example

```csharp
using UnityEngine;

public class Example : MonoBehaviour
{
    public string myString = "42";

    void Start()
    {
        long myInt = WString.ToInt(myString);
        Debug.Log("Converted integer value: " + myInt);
    }
}
```