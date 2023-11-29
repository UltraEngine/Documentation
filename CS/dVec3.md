# dVec3 #
This structure describes a three-dimensional vector with double float precision.

## Members ##
- double **x**, **r**, **width**
- double **y**, **g**, **height**
- double **z**, **b**, **depth**

## Constructors ##
- **dVec3**()
- **dVec3**(const double x)
- **dVec3**(const double x, const double y)
- **dVec3**(const double x, const double y, const double z)

## Methods ##
- DistanceToPoint
- [Dot](dVec3_Dot)
- Cross
- Inverse
- Length
- [Normalize](dVec3_Normalize)
- Reflect

### Example ###
```csharp
using UnityEngine;

public class VectorExample : MonoBehaviour
{
    private void Start()
    {
        dVec3 vec = new dVec3(1.0, 2.0, 3.0);
        double length = vec.Length();
        Debug.Log("Vector length: " + length);

        dVec3 normalizedVec = vec.Normalize();
        Debug.Log("Normalized vector: (" + normalizedVec.x + ", " + normalizedVec.y + ", " + normalizedVec.z + ")");
    }
}
```