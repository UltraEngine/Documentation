# Assert #
This function produces a runtime error if the supplied condition or object is false or NULL.

## Syntax ##
- void **Assert**(const bool condition)
- void **Assert**(const bool condition, const [WString](WString.md)& message)
- void **Assert**(shared_ptr<Object> o)
- void **Assert**(shared_ptr<Object> o, const [WString](WString.md)& message)

### Parameters ###

| Name | Description |
|---|---|
| condition | if false a runtime error is generated |
| o | if NULL a runtime error is generated |
| message | error message to display |
