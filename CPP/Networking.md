# Networking

Ultra Engine includes a simple networking system based on the [Enet networking library](http://enet.bespin.org/) that allows communication between different computers. This is useful for basic testing and  communication between two applications running on the same machine. However, most home computers are connected to the Internet through a router that blocks incoming connections from other IP addresses. For this reason the [Steamworks](https://partner.steamgames.com/doc/api/ISteamNetworking) peer-to-peer networking system is recommended for most multiplayer games.

It is also possible to use Ultra Engine networking to build a relay server that allows two or more computers to communicate, but an implementation is beyond the scope of this documentation.
