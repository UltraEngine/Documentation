# Material File Format #
The material (.mtl) file format is a JSON-based file format for storing materials.

```json
{
	"material":
	{
		"color": [1,1,1,1],
		"emission": [0,0,0],
		"metallic": 1,
		"roughness": 1,
		"mappingScale": 16,
		"textures":
		[
			{
				"slot": "BASE",
				"file": "./rocky_soil_diffuse.basis",
				"filter": "LINEAR",
				"clamp": [false, false, false]
			},
			{
				"slot": "NORMAL",
				"file": "./rocky_soil_normal.basis",
				"scale": 1
			},
			{
				"slot": "DISPLACEMENT",
				"file": "./rocky_soil_height.basis",
				"scale": 0.05
			},
			{
				"slot": "BRDF",
				"file": "Materials/BRDF/default.dds"
			}
		]
	}
}
```
The texture slot value can be an integer from 0-31 or one of these strings:
- BASE
- NORMAL
- METALLIC_ROUGHNESS
- DISPLACEMENT
- EMISSION
- BRDF
