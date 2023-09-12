# Seed
This function sets the seed for pseudorandom number calculation.

**Syntax**

```lua
function Seed(seed: number)
```

**Example**

```lua
Seed(Millisecs())

Print(Random())
Print(Random(10))
Print(Random(10, 20))
```