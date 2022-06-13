# Terrain::LoadHeightmap

This method loads a heightmap onto the terrain.

## Syntax

- bool **LoadHeightmap**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

## Example

```c++
auto terrain = CreateTerrain(world, 1024, 1024);
terrain->SetHeight(0, 0, 10.0f);
terrain->LoadHeightmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Terrain/1024.r16");
terrain->SetScale(1, 300, 1);
```
