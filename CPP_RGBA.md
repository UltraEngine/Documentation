# RGBA #
This function combines four 8-bit color channels into a single packed RGBA color.

## Syntax ##
- unsigned int RGBA(const unsigned char r, const unsigned char g, const unsigned char b, const unsigned char a = 255)

### Parameters ###
| Name | Description |
| --- | --- |
| r | red component |
| g | green component |
| b | blue component |
| a | alpha component |

## Returns ##
Returns an RGBA color packed into a single integer. The individual color channel values can be extracted with the [Red](CPP_Red), [Green](CPP_Green.md), [Blue](CPP_Blue.md), and [Alpha](CPP_Alpha.md) functions.
