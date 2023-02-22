# WebMapService

This class provides an interface to easily communicate with a web map service, for loading terrain data from real-world data sets. This can be combined with the streaming terrain system to display large-scale worlds based on real world locations, or even entire planets.

| Property | Type | Description |
|---|---|---|
| url | String | |
| capabilities | [WMSCapablities](WMSCapablities.md) | description of server features, layers, and other stuff |
| [FetchMap](WMSServer_FetchMap.md) | Method | retrieves a map image with the specified parameters |

## Availabilty

This class is only available in the enterprise version.

| Indie | Pro | Enterprise |
|---|---|---|
| ✕ | ✕ | ✓ |
