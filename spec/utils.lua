local M = require("src.utils")

--[[**** TESTS               ***********************************************]]

--[[#### Range generator     ###############################################]]

local range_test1, err_range_test1 = M.range(10, 30, 2)
io.write("range() test 1:\n> ")
if not range_test1 then
  print(string.format("%s\n", err_range_test1))
else
  for _, v in pairs(range_test1) do io.write(string.format("%d ", v)) end
  print("\n")
end

local range_test2, err_range_test2 = M.range(30, 10, -3)
io.write("range() test 2:\n> ")
if not range_test2 then
  print(string.format("%s\n", err_range_test2))
else
  for _, v in pairs(range_test2) do io.write(string.format("%d ", v)) end
  print("\n")
end

local range_test3, err_range_test3 = M.range(10, "30", "g")
io.write("range() test 3:\n> ")
if not range_test3 then
  print(string.format("%s\n", err_range_test3))
else
  for _, v in pairs(range_test3) do io.write(string.format("%d ", v)) end
  print("\n")
end

--[[#### Sum getter          ###############################################]]

local sum_test1, err_sum_test1 = M.sum({ 1, 2, 3, 4 })
io.write("sum() test 1:\n> ")
if not sum_test1 then
  print(string.format("%s\n", err_sum_test1))
else
  io.write(sum_test1)
  print("\n")
end

local sum_test2, err_sum_test2 = M.sum({ "a", "b", "c" })
io.write("sum() test 2:\n> ")
if not sum_test2 then
  print(string.format("%s\n", err_sum_test2))
else
  io.write(sum_test2)
  print("\n")
end

--[[#### String splitter     ###############################################]]

local split_test1, err_split_test_1 = M.split("aboba", "b")
io.write("split() test 1:\n> ")
if not split_test1 then
  print(string.format("%s\n", err_split_test_1))
else
  for _, v in ipairs(split_test1) do io.write(string.format("%s, ", v)) end
  print("\n")
end

local split_test2, err_split_test_2 = M.split("aboba", "v")
io.write("split() test 2:\n> ")
if not split_test2 then
  print(string.format("%s\n", err_split_test_2))
else
  for _, v in ipairs(split_test2) do io.write(string.format("%s, ", v)) end
  print("\n")
end

local split_test3, err_split_test_3 = M.split(nil, "t")
io.write("split() test 3:\n> ")
if not split_test3 then
  print(string.format("%s\n", err_split_test_3))
else
  for _, v in ipairs(split_test3) do io.write(string.format("%s, ", v)) end
  print("\n")
end

--[[**** END OF TESTS        ***********************************************]]
