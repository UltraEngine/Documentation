# 2D Graphics

In Ultra Engine, 2D graphics are achieved by rendering 3D primitives from the view of a camera with an orthogonal (flat) projection matrix. By routing all our 2D rendering through the fast-path 3D rendering pipeline, we can take advamtage of rendering and culling optimizations. For example, we can use the depth buffer to determine which pixel lies on top of others instead of drawing primitives in order back to front, and thus take advantage of the improved performance of GPU instancing.

Sprites are a special type of 3D object that can be used to draw rectangles or images on the screen.

You can create multiple cameras with different projection modes, and make 2D graphics appear on top of 3D rendering, or render a 3D scene on top of a flat backdrop.
