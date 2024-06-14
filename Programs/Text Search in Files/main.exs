defmodule FileSearch do
  def search_files(directory, pattern) do
    File.ls!(directory)
    |> Enum.filter(&File.regular?(Path.join(directory, &1)))
    |> Enum.flat_map(fn file ->
      File.read!(Path.join(directory, file))
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, pattern))
      |> Enum.map(fn line -> %{file: file, line: line} end)
    end)
  end
end

IO.inspect FileSearch.search_files(".", "elixir")
