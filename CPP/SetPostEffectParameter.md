# Camera::SetPostEffectParameter

## Syntax

- bool **SetPostEffectParameter**(const int index, const WString& name, const float value)
- bool **SetPostEffectParameter**(const int index, const WString& name, const Vec2& value)
- bool **SetPostEffectParameter**(const int index, const WString& name, const Vec3& value)
- bool **SetPostEffectParameter**(const int index, const WString& name, const Vec4& value)

| Parameter | Description |
|---|---|
| index |  |
| name |  |
| value |  |

## Returns

Returns true if the value is successfully set, otherwise false is returned.

## Remarks

Post-processing effect parameters are defined in JSON files in a parameters object:

```json
        "parameters":
        [
            {
                "name": "strength",
                "offset": 0,
                "size": 1,
                "default": 1.2
            },
            {
                "name": "samples",
                "offset": 2,
                "size": 2,
                "default": [8,8]
            }
        ]
```

## Example

```c++

```
