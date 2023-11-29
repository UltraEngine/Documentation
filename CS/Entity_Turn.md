```csharp
void Turn(xQuat rotation, bool global = false);
void Turn(xVec3 rotation, bool global = false);
void Turn(float pitch, float yaw, float roll, bool global = false);
```

| Parameter | Description |
| --- | --- |
| rotation, (pitch, yaw, roll) | rotation to apply |
| global | if set to true global space is used, otherwise local space is used |