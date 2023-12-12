# Steamworks

Ultra Engine includes an optional module for adding functionality from the Steam API. These features can be added to your project by including the file "Steamworks/Steamworks.h" and enabling the "Steamworks/Steamworks.cpp" file.

This module is intended to provide easy access to the most commonly used Steam features. Including this module also provides direct access to the [Steamworks API](https://partner.steamgames.com/doc/api).

| Property | Type | Description |
|---|---|---|
| [AddStat](Steamworks_AddStat.md) | Function | increments a user statistic |
| [AppInstalled](Steamworks_AppInstalled.md) | Function | checks if the specified app is installed |
| [AppSubscribed](Steamworks_AppSubscribed.md) | Function | checks if the specified app is authorized to be run |
| [Disconnect](Steamworks_Disconnect.md) | Function | disconnects a peer-to-peer connection |
| [DlcInstalled](Steamworks_DlcInstalled.md) | Function | checks if the specified DLC is installed for this application |
| [FilterVoice](Steamworks_FilterVoice.md) | Function | used to control which players can hear each other |
| [GetAchievement](Steamworks_GetAchievement.md) | Function | checks if a user achievement has been earned |
| [GetAppId](Steamworks_GetAppId.md) | Function | gets this application's ID |
| [GetBuildId](Steamworks_GetBuildId.md) | Function | gets the application build ID |
| [GetPacket](Steamworks_GetPacket.md) | Function | retrieves the next available packet received |
| [GetStat](Steamworks_GetStat.md) | Function | gets a user statistic |
| [GetUserAvatar](Steamworks_GetUserAvatar.md) | Function | gets the user's Steam profile picture |
| [GetUserId](Steamworks_GetUserId.md) | Function | gets the user's Steam profile ID |
| [GetUserName](Steamworks_GetUserName.md) | Function | gets the user's Steam profile name |
| [Initialize](Steamworks_Initialize.md) | Function | Initializes the Steam API |
| [RecordVoice](Steamworks_RecordVoice.md) | Function | sets the microphone recording state, for in-game voice chat |
| [SendPacket](Steamworks_SendPacket.md) | Function | sends data to another user |
| [SetAchievement](Steamworks_SetAchievement.md) | Function | sets a user achievement |
| [SetStat](Steamworks_SetStat.md) | Function | sets a user statistic |
| [Shutdown](Steamworks_Shutdown.md) | Function | closes the Steam API |
| [Update](Steamworks_Update.md) | Function | should be called once per frame |
