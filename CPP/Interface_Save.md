# Interface::Save #
This method saves the interface to a file or stream.

## Syntax ##
- bool **Save**(const [WString](WString.md)& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(shared_ptr<[Stream](Stream.md)\> stream, const SaveFlags flags = SAVE_DEFAULT)

## Returns ##
Returns true if the interface is successfully saved, otherwise false is returned.
