# MeshLayer::SetWeight

This method sets the weighting factor for the specified variation. This controls how frequently the variation appears.

## Syntax

- void **SetWeight**(const float weight, const bool normalize = true)

| Parameter | Description |
|---|---|
| weight | relative weight, between 0 and 1 |
| normalize | if set to true, the sum of all variation weights in the mesh layer will be made equal to one |
