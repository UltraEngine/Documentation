# Float Precision #

The engine provides two builds with different float precision. The 32f uses 32-bit floating point values for object orientations. This is what most games use, and will provide good precision for areas up to a few square kilometers. Larger simulations and games will require greater float precision. For these types of projects the 64f build should be used. This will use 64-bit floating point values for all object orientations. 64-bit floats are slower, so this build should only be used when it is needed.

Programming with the 64-bit float build uses some different classes.

Note that the 64-bit float build does not replace all float values with double. Double float values are only used for properties that benefit from increased precision.

32f:
```c++
Vec3 pos = entity->GetPosition();
```

64f:
```c++
dVec3 pos = entity->GetPosition();
```

You can make your code work with both builds by using the DOUBLE_FLOAT preprocessor definition to execute different code for each build:
```c++
#ifdef DOUBLE_FLOAT
dVec3 pos = entity->GetPosition();
#else
Vec3 pos = entity->GetPosition();
#endif
```

You can also use the *auto* keyword so the return type does not have to be declared:
```c++
auto pos = entity->GetPosition();
```
