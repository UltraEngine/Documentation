```csharp
void SetAngularVelocity(xVec3 omega, bool global = true);
void SetAngularVelocity(float x, float y, float z, bool global = true);
```

| Parameter | Description |
| --- | --- |
| omega, (x, y, z) | angular velocity to set, in degrees per second |
| global | if set to true angular velocity is in global space, otherwise local space is used |