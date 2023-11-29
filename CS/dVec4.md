# dVec4 #
This structure describes a four-dimensional vector with double float precision.
## Members ##
- double **x**, **r**
- double **y**, **g**
- double **z**, **b**
- double **w**, **a**

## Constructors ##
- **dVec4**()
- **dVec4**(double x)
- **dVec4**(double x, double y)
- **dVec4**(double x, double y, double z)
- **dVec4**(double x, double y, double z, double w)

## Example ##
```csharp
dVec4 vector = new dVec4();
dVec4 vector2 = new dVec4(1.0);
dVec4 vector3 = new dVec4(1.0, 2.0);
dVec4 vector4 = new dVec4(1.0, 2.0, 3.0);
dVec4 vector5 = new dVec4(1.0, 2.0, 3.0, 4.0);
```