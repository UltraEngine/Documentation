# Widget::FilterInput #

This method sets a user callback that can be used to ignore specific keyboard input.

## Syntax ##

- void **FilterInput**(bool filter(const KeyCode keychar, shared_ptr<Object> extra), shared_ptr<Object> extra = NULL)

| Parameter | Description |
|---|---|
| filter | callback filter function |
| extra | extra object to pass to the callback |
