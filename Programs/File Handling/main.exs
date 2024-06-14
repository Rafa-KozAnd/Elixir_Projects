defmodule FileManager do
  def read_file(path) do
    case File.read(path) do
      {:ok, content} -> content
      {:error, reason} -> "Failed to read file: #{reason}"
    end
  end

  def write_file(path, content) do
    File.write(path, content)
  end
end

FileManager.write_file("test.txt", "Hello, Elixir!")
IO.puts FileManager.read_file("test.txt")
