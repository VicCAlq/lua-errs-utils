# Lua Errs Utils
<hr/>

## About

This library contains a few helper utils that follow the pattern of returning errors as values, commonly seen in languages like Rust and Gleam. It relies on the usage of `pcall()` to handle successes or failures.

The following example demonstrates the use case:

```lua
local utils = require("lua-errs-utils")

-- We have a variable to hold the result of a computation done
-- inside a `pcall()`
local computed_var = nil

-- Here we use `pcall()` to get a success status and a possible result
-- from an operation that might err
local success, diagnostic = pcall(function()
    computed_var = operation_that_can_err    
end)

-- We can then get a result and err variables, that can be used
-- to proceed with the aplication or decide on how to handle the error
result, err = utils.handle_res(computed_var, success, diagnostic)
```

Among the other utils we have:
1. `range()` - Similar to Python's `range()` function. Receives a required `start` and `end` numbers, and a third optional number to define the `step`
2. `sum()` - Receives a table of numbers, returns its sum
3. `split()` - Receives a string and a separator, returns a table containing the resulting strings.

All of those functions return the `result` (which can be `nil` in case of errors) and the `error`, which will be `nil` if the function succeeds.

## Reasoning
Lua already has its own error handling syntax, this utility merely provides a method to reinforce error handling without the need of littering the codebase with `if not x then err else y end`. It's also a good pattern to help remember to actually deal with the errors, rather than waiting for them to happen before eventually handling them.

Also, it's a pattern I enjoy using, so why not?

## Requirements
1. Lua 5.1

## To-Do
Lots of things, and I'm taking suggestions.

## License

This library is licensed under the MIT License. See the file LICENSE.md.
