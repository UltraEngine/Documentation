# Seed
This functions sets the seed for psuedorandom number calculation.

## Syntax

- void **Seed**(int seed)

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Seed(Millisecs());

        Print(Random());
        Print(Random(10));
        Print(Random(10, 20));
    }
}
```