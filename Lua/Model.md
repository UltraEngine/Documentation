# Model

Base class: [Entity](Entity.md)

The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

Ultra Engine natively supports loading and saving of models in the [glTF](https://www.khronos.org/gltf/) and Wavefront OBJ file formats. Other model formats can be loaded via the [plugin](Plugin.md) system.

| Property | Type | Description |
|---|---|---|
| lods | const table | read-only array of Lods |
| skeleton | const table | read-only skeleton object |
| [AddMesh](#model_addmesh) | Method | adds a new mesh to the model |
| [AddLod](#model_addlod) | Method | adds a new level-of-detail to the model |
| [Animate](#model_animate) | Method | animates the model |
| [Clear](#model_clear) | Method | removes all meshes |
| [Save](#model_save) | Method | saves the model to a file |
| [SetLodDistance](#model_setloddistance) | Method | sets the base Lod distance factor |
| [SetSkeleton](#model_setskeleton) | Method | allows models to share a single skeleton |
| [UpdateNormals](#model_updatenormals) | Method | calculates new mesh normals |
| [CreateBox](#createbox) | Function | creates a new box model |
| [CreateCone](#createcone) | Function | creates a new cone model |
| [CreateCubeSphere](#createcubesphere) | Function | creates a new sphere model |
| [CreateCylinder](#createcylinder) | Function | creates a new cylinder model |
| [CreateModel](#createmodel) | Function | creates a new model |
| [CreatePlane](#createplane) | Function | creates a new plane model |
| [CreateSphere](#createsphere) | Function | creates a new sphere model |
| [LoadModel](#loadmodel) | Function | loads a model from a file |

## Model:AddMesh

```lua
function Model:AddMesh(mesh)
```

Adds a new mesh to the model.

#### Parameters
- `mesh` (table): The mesh to add to the model.

## Model:AddLod

```lua
function Model:AddLod(lod)
```

Adds a new level-of-detail to the model.

#### Parameters
- `lod` (table): The level-of-detail to add to the model.

## Model:Animate

```lua
function Model:Animate(timeDelta)
```

Animates the model.

#### Parameters
- `timeDelta` (number): The time difference between frames, in seconds.

## Model:Clear

```lua
function Model:Clear()
```

Removes all meshes from the model.

## Model:Save

```lua
function Model:Save(filename)
```

Saves the model to a file.

#### Parameters
- `filename` (string): The name of the file to save the model to.

## Model:SetLodDistance

```lua
function Model:SetLodDistance(distance)
```

Sets the base Lod distance factor.

#### Parameters
- `distance` (number): The base Lod distance factor.

## Model:SetSkeleton

```lua
function Model:SetSkeleton(skeleton)
```

Allows models to share a single skeleton.

#### Parameters
- `skeleton` (table): The skeleton object to share.

## Model:UpdateNormals

```lua
function Model:UpdateNormals()
```

Calculates new mesh normals.

## CreateBox

```lua
function CreateBox(width, height, depth)
```

Creates a new box model.

#### Parameters
- `width` (number): The width of the box.
- `height` (number): The height of the box.
- `depth` (number): The depth of the box.

## CreateCone

```lua
function CreateCone(radius, height, subdivisions)
```

Creates a new cone model.

#### Parameters
- `radius` (number): The radius of the cone.
- `height` (number): The height of the cone.
- `subdivisions` (number): The number of subdivisions used for the cone.

## CreateCubeSphere

```lua
function CreateCubeSphere(radius, subdivisions)
```

Creates a new sphere model.

#### Parameters
- `radius` (number): The radius of the sphere.
- `subdivisions` (number): The number of subdivisions used for the sphere.

## CreateCylinder

```lua
function CreateCylinder(radius, height, subdivisions)
```

Creates a new cylinder model.

#### Parameters
- `radius` (number): The radius of the cylinder.
- `height` (number): The height of the cylinder.
- `subdivisions` (number): The number of subdivisions used for the cylinder.

## CreateModel

```lua
function CreateModel()
```

Creates a new model.

## CreatePlane

```lua
function CreatePlane(width, length)
```

Creates a new plane model.

#### Parameters
- `width` (number): The width of the plane.
- `length` (number): The length of the plane.

## CreateSphere

```lua
function CreateSphere(radius, subdivisions)
```

Creates a new sphere model.

#### Parameters
- `radius` (number): The radius of the sphere.
- `subdivisions` (number): The number of subdivisions used for the sphere.

## LoadModel

```lua
function LoadModel(filename)
```

Loads a model from a file.

#### Parameters
- `filename` (string): The name of the file to load the model from.