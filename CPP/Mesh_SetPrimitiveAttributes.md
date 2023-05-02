# Mesh::SetPrimitiveAttributes

This method is used to set per-primitive attributes that are used in tessellation.

## Syntax

- void **SetPrimitiveAttributes**(const unsigned int primitice, const PrimitiveAttributes attribs)

| Parameter | Description |
|---|---|
| primitive | primitive index |
| attribs | attributes, can be PRIMITIVE_TESSELLATE_NONE or any combination of PRIMITIVE_TESSELLATE_EDGE0, PRIMITIVE_TESSELLATE_EDGE1, PRIMITIVE_TESSELLATE_EDGE2, PRIMITIVE_TESSELLATE_EDGE3, PRIMITIVE_TESSELLATE_ALL, and PRIMITIVE_COPLANAR |

## Remarks

The tessellation settings of each primitive can be adjusted to control how a polygon is subdivided. Each edge can have subdivision enabled or disabled. Additionally, the COPLANAR flag helps the engine optimize flat faces that may not need subdivision in the interior of the primitive.
