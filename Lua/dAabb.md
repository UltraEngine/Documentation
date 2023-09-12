## Documentation

### class Foo

#### Public Members
- `Foo()`
    - Constructs a new `Foo` object.
- `void bar() const`
    - Performs the bar operation on the `Foo` object.
- `int baz(int x)`
    - Performs the baz operation on the `Foo` object with an integer parameter `x`.
- `void setX(double x)`
    - Sets the value of `x` for the `Foo` object.

### class Baz

#### Public Members
- `Baz()`
    - Constructs a new `Baz` object.
- `void qux() const`
    - Performs the qux operation on the `Baz` object.
- `string getStr() const`
    - Retrieves the `str` value of the `Baz` object.

## Example

```lua
-- Creating a new Foo object
local foo = Foo()

-- Performing the bar operation on foo
foo:bar()

-- Performing the baz operation on foo with parameter 5
local result = foo:baz(5)

-- Setting the value of x for foo to 3.14
foo:setX(3.14)

-- Creating a new Baz object
local baz = Baz()

-- Performing the qux operation on baz
baz:qux()

-- Retrieving the str value of baz
local str = baz:getStr()
```