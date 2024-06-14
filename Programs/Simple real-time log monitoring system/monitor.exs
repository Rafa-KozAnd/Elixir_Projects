# monitor.exs
defmodule Main do
  def run do
    file_path = "caminho/do/seu/arquivo/de/log.log"  # Substitua pelo caminho do seu arquivo de log
    LogMonitor.start_monitor(file_path)
    IO.puts "Monitorando o arquivo de log em tempo real..."
  end
end

Main.run()
