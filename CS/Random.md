```csharp
using System;
using UnityEngine;

public class RandomExample : MonoBehaviour
{
    void Start()
    {
        UnityEngine.Random.InitState(DateTime.Now.Millisecond);

        Debug.Log(Random());
        Debug.Log(Random(10));
        Debug.Log(Random(10, 20));
    }

    float Random(float maxima = 1.0f)
    {
        return UnityEngine.Random.value * maxima;
    }

    float Random(float minima, float maxima)
    {
        return UnityEngine.Random.Range(minima, maxima);
    }
}
```