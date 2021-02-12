# Clamp #
This function constrains a value between a lower and upper limit.

## Syntax ##
- float **Clamp**(const float value, const float minimum, const float maximum)
- double **Clamp**(const double value, const double minimum, const double maximum)
- int **Clamp**(const int value, const int minimum, const int maximum)

### Parameters ###
| Name | Description |
| --- | --- |
| value | value to constrain |
| minimum | lower limit of the return value |
| maximum | upper limit of the return value |

## Returns ##
The closest value to the input value that is between the specified minimum and maximum will be returned.