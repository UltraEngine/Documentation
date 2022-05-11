# Mesh::Finalize

When mesh data sent to the renderer, a minimal amount of data is efficiently packed into a small structure in order to maximize speed. This method compresses the mesh, then submits the data to the renderer in a format for optimal rendering performance. Changes to the mesh geometry will not be visible until this command is called.

## Syntax

- void **Finalize**()
