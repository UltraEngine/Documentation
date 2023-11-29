```C#
void SetVelocity(float x, float y, float z, bool global = true);
void SetVelocity(xVec3 velocity, bool global = true);
```

| Parameter | Description |
| --- | --- |
| velocity, (x, y, z) | velocity to set, in meters per second |
| global | if set to true velocity is in global space, otherwise local space is assumed |