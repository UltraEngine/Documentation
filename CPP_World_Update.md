# World::Update #
This method updates timing, physics, and other systems. This should be called once per frame in a loop.

## Syntax ##
- void **Update**(const int frequency = 60, const int iterations = 0, const int threads = 0, const int substeps = 1)

### Parameters ###
| Name | Description |
| --- | --- |
| **frequency** | number of updates per second |
| **iterations** | number of physics iterations, or zero for the exact solver |
| **threads** | number of physics threads, or zero for automatic |
| **substeps** | number of physics sub-steps |
