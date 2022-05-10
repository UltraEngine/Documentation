# Mesh::Finalize

When mesh data sent to the renderer, a minimal amount of data is efficiently packed into a small structure in order to maximize speed. This method compresses and submits the mesh data to the renderer. Changes to the mesh geometry will not be visible until this command is called.

## Syntax

- void **Finalize**()
