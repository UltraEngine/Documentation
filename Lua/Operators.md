# Operators

In this lesson we'll review all the logical operators that are available to use in Lua.  Operators are special expessions that can be used to determine the relationship of two values.  They are often used in "if" statements to execute code when a condition is met.

## Equals

The equals operator is denoted by two equals signs in a row: `==`

The equals operator is a test to see if two values are equal.  This does not assign a value to a variable.

```lua
n = 2
if n == 2 then
        Print("n equals 2")
end
```

The equals operator can be used with any data type, including strings and boolean values.

```lua
name = "Fred"
if name == "Fred" then
        Print("The name's Fred")
end
```

## Less Than

The less than operator determines if one number is smaller than another.  The less than sign looks a little bit like a bird's beak if you picture the bird facing to the left: `<`

Remember, birds don't eat a lot, so the number where his beak points is smaller.  Here's an example of it in action:

```lua
a = 1
if a < 2 then
        Print("a is less than 2")
end
```

## Greater Than

The greater than operator determines if one number is larger than another.  The greater than sign looks a little bit like an alligator's mouth if you picture the alligator facing to the left: `>`

Remember, alligators eat a lot, so the number where his mouth points is bigger.  Here's an example of it in action:

```lua
a = 1
if a > 0 then
        Print("a is greater than 0")
end
```

## Less Than or Equal To

This is a variation of the less than operator that will also be true if the values are equal. It is denoted by a less than sign followed by a single equals sign:
`<=`
Here is an example of its usage:

```lua
a = 1
if a <= 1 then
        Print("a is less than or equal to 1")
end
```

## Greater Than or Equal To

This is a variation of the greater than operator that will also be true if the values are equal.   It is denoted by a greater than sign followed by a single equals sign:
`>=`
Here is an example of its usage:

```lua
a = 1
if a >= 1 then
        Print("a is greater than or equal to 1")
end
```

## Not Equal

This operator is the opposite of the equals operator.  It is indicated by a tilde character followed by a single equals sign:
`~=`
Here is an example of its usage:

```lua
a = 1
if a ~= 5 then
        Print("a does not equal 5")
end
```

## Logical Operators

Okay, now things are going to get a little weird. Computers use a lot of power-of-two numbers. Power-of-two numbers are what you get if you start with one and just keep multiplying by two:
> 1 x 2 = 2  
> 2 x 2 = 4  
> 4 x 2 = 8  
> 8 x 2 = 16  
> 16 x 2 = 32  
> 32 x 2 = 64  
> 64 x 2 = 128  
> 128 x 2 = 256  

The funny thing about power-of-two numbers is that when we combine them we can tell which numbers we used to make the new number. For example:
> 1 + 2 = 3

We know that if three is made by adding power-of-two numbers together, the two numbers we used are one and two. Here's another example:
> 2 + 4 = 6

The only power-of-two numbers you can add together to make six are four and two!

Let's try another. What power-of-two numbers can we add together to make the number 13?
> 1 + 4 + 8 = 13

This works with all power-of-two numbers, into infinity.

## Logical OR

Sometimes programmers like to use this super power to combine multiple values into a single variable. These are called "bitwise flags" and are often used for optional settings that are being passed to a function, like the window create function.

```lua
window = CreateWindow("My Window", 0, 0, 800, 600, display, WINDOW_CENTER | WINDOW_TITLEBAR )
```

## Logical AND



## Conclusion

You will frequently encounter all of these operators while writing Lua scripts.  Make sure you understand how they all work, and ask on the forum if you have any questions.  You're doing great!
