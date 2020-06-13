# CreateNavMesh #
This function creates a new Navmesh object for pathfinding.

## Syntax ##
- shared_ptr<NavMesh> **CreateNavMesh**(shared_ptr<World\> world, const float width, const float height, const float depth, const int tilesx, const int tilesz, const float voxelsize = 0.25, const float agentradius = 0.4, const float agentheight = 1.8, const float agentstepheight = 0.501, const float maxslope = 45.01);

## Parameters ##
| Name | Description |
| --- | --- |
| **world** | world to create the navmesh in |
| **width** | width of the navmesh volume |
| **height** | width of the navmesh volume |
| **depth** | width of the navmesh volume |
| **tilesx** | number of tiles along the X axis |
| **tilesz** | number of tiles along the Z axis |
| **voxelsize** | resolution of voxel grid |
| **agentradius** | radius of the characters that will use this navmesh |
| **agentheight** | height of the characters that will use this navmesh |
| **agentstepheight** | maximum height that can be stepped up |
| **maxslope** | maximum slope that can be traversed, in degrees |

## Returns ##
Returns a new Navmesh object.
