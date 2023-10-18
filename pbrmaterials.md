# PBR Materials and Lighting

Ultra Engine makes use of physically-based rendering to deliver next-gen visuals with realistic lighting. Several different settings in materials and the environment combine to produce the appearance of a surface.

Direct lighting is achieved with point, spot, directional, and box lights. These each use a different lighting equation to simulate a light source with texture-based shadows (shadow maps).

Indirect lighting is achieved through a set of world environment textures and smaller local environment probes. Because PBR materials accurately reflect the surrounding environment, it's important to have good reflection data.
