defmodule LogMonitor do
  def start_monitor(file_path) do
    spawn(fn ->
      File.stream!(file_path)
      |> Stream.repeatedly(&IO.read/1)
      |> Stream.each(&process_log_line/1)
      |> Stream.run()
    end)
  end

  defp process_log_line(line) do
    IO.puts "Nova linha de log: #{line}"
  end
end
