# dQuat #
This structure describes a quaternion rotation with double float precision.

## Members ##
- double **x**
- double **y**
- double **z**
- double **w**

## Constructors ##
- **Quat**(double x, double y, double z, double w)
- **Quat**(dVec3 euler)
- **Quat**(double angle, dVec3 axis)

## Methods ##
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp

```csharp
# dQuat Structure

This structure describes a quaternion rotation with double float precision.

## Members
- double **x**
- double **y**
- double **z**
- double **w**

## Constructors
- **Quat**(double x, double y, double z, double w)
- **Quat**(dVec3 euler)
- **Quat**(double angle, dVec3 axis)

## Methods
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp

```

```csharp
// Example usage in C#

// Creating a quaternion with specific x, y, z, and w values
Quat quat1 = new Quat(0.5, 0.2, 0.7, 1.0);

// Creating a quaternion from Euler angles
dVec3 eulerAngles = new dVec3(45.0, 30.0, 60.0);
Quat quat2 = new Quat(eulerAngles);

// Creating a quaternion from an angle and axis
double angle = 90.0;
dVec3 axis = new dVec3(1.0, 0.0, 0.0);
Quat quat3 = new Quat(angle, axis);

// Example method calls
quat1.Euler();
quat1.GetAverageOmega();
quat1.Inverse();
quat1.Normalize();
quat1.Slerp();
```