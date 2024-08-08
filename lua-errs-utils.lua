local utils = require("src.utils")

-- Some sample tables
local simple_table = { "text", 123, "not a number", 45.67 }
local object_table = {
  name = "Joan",
  age = 30,
  height = 1.75,
  occupation = "Historian"
}
local sub_tables = {
  address = {
    street = "Void Street",
    number = 77,
    complement = "Apt 7"
  },
  phones = { 404123456789, 404987654321, 200132465798 },
  emails = { "lil_joan@past.org", "current_joan@present.org", }
}

-- Table elements concatenation (for string and number elements only)
-- (table, separator?, start_index?, end_index?)
local string1 = table.concat(simple_table)              -- text123not a number45.67
local string2 = table.concat(simple_table, " | ")       -- text | 123 | not a number | 45.67
local string3 = table.concat(simple_table, " | ", 2)    -- text | 123 | not a number | 45.67
local string4 = table.concat(simple_table, " | ", 1, 3) -- text | 123 | not a number | 45.67

print(string1)
print(string2)
print(string3)
print(string4)
io.write("> ")

return utils
