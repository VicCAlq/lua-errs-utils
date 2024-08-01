---@meta Module 'utils'
---This module contains some functions and builders to common operations.
---For the functions, they're built with the "errors as values" pattern.

local M = {}

--[[#### Error handler       ###############################################]]

---Receives a computed property, a success status and a possible error
---message, to internally handle atribution to result and err values
---@param computed any The computed result
---@param status boolean Status of the computation
---@param diagnostic any|nil Possible error message
---@return any result Processed result, might be nil
---@return any err Processed error, might be nil
function M.handle_res(computed, status, diagnostic)
  local result, err = nil, nil

  if not status then
    result = nil
    err = diagnostic
  else
    result = computed
  end

  return result, err
end

--[[#### Success and errors as values ######################################]]

---Receives a function with its arguments, and two other functions,
---one to handle the success case, and another to handle the error case
---@param call fun(any): any, any
---@param success_call fun(any): any
---@param err_call fun(any): any
---@return any final_result Result after being processed by either success_call or err_call
function M.custom_res(call, success_call, err_call)
  local result, err = call
  local final_result = nil

  if not result then
    final_result = err_call(err)
  else
    final_result = success_call(result)
  end

  return final_result
end

--[[#### Range generator     ###############################################]]

---Creates a list of numbers given a range
---@param a number Start of range
---@param b number End of range
---@param s number?|nil? Step (optional, default = 1)
---@return table<number>|nil result List with number range or nil
---@return any err Possible error, nil if no errors are found
function M.range(a, b, s)
  local result, err = nil, nil
  local step = s or 1
  local num_range = {}

  if a == b then
    result = { a }
    return result, err
  end

  local status, diagnostic = pcall(function()
    for i = a, b, step do table.insert(num_range, i) end
  end)

  result, err = M.handle_res(num_range, status, diagnostic)

  return result, err
end

--[[#### Sum getter          ###############################################]]

---Accumulator function
---@param numbers table<number> number Numbers to accumulate
---@return number|nil result Sum of numbers, nil if it errs
---@return any err Possible error, nil if no errors are found
function M.sum(numbers)
  local result, err = nil, nil
  local accumulator = 0

  local status, diagnostic = pcall(function()
    for _, v in pairs(numbers) do
      accumulator = accumulator + v
    end
  end)

  result, err = M.handle_res(accumulator, status, diagnostic)

  return result, err
end

--[[#### String splitter     ###############################################]]

---String splitting function
---@param string_to_split string String to split
---@param separator string String to use as separator (default = " ")
---@return table<string>|nil result List of words, nil if it errs
---@return any err Possible error, nil if no errors are found
function M.split(string_to_split, separator)
  local result, err = {}, nil
  local sep = separator or " "
  local start = nil

  local find_status, find_diagnostic = pcall(function()
    start, _, _ = string.find(string_to_split, sep)
  end)

  if not find_status then
    result = nil
    err = find_diagnostic
    return result, err
  end

  if not start then
    result = { string_to_split }
    return result, err
  end

  local strings_list = {}
  local pattern = string.format("([^%s]+)", sep)

  ---Splits the string on the spaces, removing them
  ---and storing everything else in the table
  local status, diagnostic = pcall(function()
    for str in string.gmatch(string_to_split, pattern) do
      table.insert(strings_list, str)
    end
  end)

  result, err = M.handle_res(strings_list, status, diagnostic)

  return result, err
end

--[[#### End of functions    ###############################################]]

return M
