# Entity.FindChild

This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax

- Entity **FindChild**(string name, bool cased = true)
- int **FindChild**(string name, List<Entity> results, bool cased = true)

| Parameter | Description |
| --- | --- |
| name | name of the entity to find |
| cased | if set to true the name search will be case-sensitive |
| results | all matching children will be added to the end of the list |

## Returns

Returns the first entity found with the specified name, or the number of children found.

## Remarks

This method can be used to find a single child or multiple children. An asterisk can be used in the name for pattern matching. For example FindChild("wheel*") would return a child named "wheel01" or "wheel_2".

## Example

```csharp
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Entity parent = CreatePivot(null);

        Entity child1 = CreatePivot(null);
        child1.SetParent(parent);
        child1.name = "thing1";

        Entity child2 = CreatePivot(null);
        child2.SetParent(parent);
        child2.name = "thing_02";

        Entity child3 = CreatePivot(null);
        child3.SetParent(parent);
        child3.name = "thing";

        Entity child4 = CreatePivot(null);
        child4.SetParent(parent);
        child4.name = "_thing_04";

        List<Entity> results = new List<Entity>();
        int count = parent.FindChild("thing*", results);

        Console.WriteLine("Found " + count + " children:");
        foreach (Entity child in results)
        {
            Console.WriteLine(child.name);
        }

        /*
        Output:

        Found 3 children:
        thing1
        thing_02
        thing
        */
    }
}
```
