# CreateNavMesh #

## Syntax ##
- shared_ptr<NavMesh> CreateNavMesh(shared_ptr<World\> world, const float width, const float height, const float depth, const int tilesx, const int tilesz, const float voxelsize = 0.25f, const float agentradius = 0.4, const float agentheight = 1.8, const float agentstepheight = 0.501, const float maxslope = 45.01f);

## Parameters ##
| Name | Description |
| --- | --- |
| **world** | world to create the navmesh in |
| **width** | width of the navmesh volume |
| **height** | width of the navmesh volume |
| **depth** | width of the navmesh volume |
| **tilesx** | number of tiles along the X axis |
| **tilesz** | number of tiles along the Z axis |
...

## Returns ##
