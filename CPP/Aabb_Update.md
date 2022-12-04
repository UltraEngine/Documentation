# Aabb::Update #
This method calculates the bounding box size, center, and radius from the minimum and maximum extents.

## Syntax ##
- void **Update**()

## Example ##
```c++
Aabb aabb;
aabb.min = Vec3(2);
aabb.max = Vec3(3);

Print("Size, center, and radius are not calculated yet:");
Print(aabb.size);
Print(aabb.center);
Print(aabb.radius);

aabb.Update();

Print("Size, center, and radius are now calulated:");
Print(aabb.size);
Print(aabb.center);
Print(aabb.radius);
```
