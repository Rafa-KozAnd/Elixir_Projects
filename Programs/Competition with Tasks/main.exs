task1 = Task.async(fn -> Enum.sum(1..10) end)
task2 = Task.async(fn -> Enum.sum(11..20) end)

result1 = Task.await(task1)
result2 = Task.await(task2)

IO.puts("Result 1: #{result1}")
IO.puts("Result 2: #{result2}")
