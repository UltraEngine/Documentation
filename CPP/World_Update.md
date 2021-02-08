# World::Update #
This method updates timing, physics, and other systems. This should be called once per frame the main application loop.

## Syntax ##
- void **Update**(const int frequency = 60, const int iterations = 0, const int threads = 0, const int substeps = 1)

| Parameter | Description |
| --- | --- |
| **frequency** | number of updates per second |
| **iterations** | number of physics iterations, or zero for the exact solver |
| **threads** | number of physics threads, or zero for automatic |
| **substeps** | number of physics sub-steps |

## Remarks ##
The update frequency can be increased for greater precision, but this will require you game code to run at a greater frequncy. The default setting of 60 hz allows your game code and physics to each execute in less than 16.7 milliseconds. A frequency of 90 hz requires your game code and physics calculations to both execute in less than 11.1 milliseconds.

By default, the physics engine will perform iterations until an exact solution is found. You can explicitly control the number of cycles with the iterations paramters. One is the fastest and least accurate, and greater numbers will be slower but more accurate.

By default the engine will allocate a number of threads for physics calculations. You can control this number by supplying a value greater than zero in the threads paramter.

For greater precision, you can split physics updating up into multiple sub-steps by providing a value greater than one in the substeps paramter. This can be useful when very precise physics behavior is needed, but more substeps can cause slower performance.
