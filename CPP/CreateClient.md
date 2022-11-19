# CreateClient

This function creates a new client and initializes a connection with the specified host.

## Syntax

- shared_ptr<[Client](Client.md)\> **CreateClient**(const [String](String.md)& host, const int port = 8888)

| Parameter | Description |
|---|---|
| host | IP address to connect to |
| port | port number to use |

## Returns

If a connection can be initialized a new client is returned, otherwise NULL is returned.

## Remarks

Note that the client will not actuallly be connected to the host until a MESSAGE_CONNECT message is returned by [Client::Update](Client_Update.md).
