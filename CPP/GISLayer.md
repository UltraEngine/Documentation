# GISLayer

This class contains information about a single GIS server map layer.

| Property | Type | Description |
|---|---|---|
| cascaded | unsigned int | |
| queryable | bool | |
| opaque | bool | |
| nosubsets | bool | |
| fixedwidth | unsigned int | |
| fixedheight | unsigned int | |
| name | String | layer name for identification |
| title | String | human-friendly layer title |
| kids | vector<[GISLayer](GISLayer.md)> | array of available sub-layers |
| styles | vector<[GISStyle](GISStyle.md)> | array of available styles |
