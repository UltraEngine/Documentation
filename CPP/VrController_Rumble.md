# VrController::Rumble

This method triggers a haptic pulse for force feedback.

## Syntax

- void **Rumble**(const VrControllerAxis axis, const int duration)

| Parameter | Description |
|---|---|
| axis | axis to detect, can be VRAXIS_TRIGGER, VRAXIS_TOUCHPAD, VRAXIS_GRIP, or any number from 0 to 5 |
| duration | length of pulse, in microseconds |
