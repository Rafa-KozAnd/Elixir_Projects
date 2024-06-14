defmodule Timer do
  def countdown(seconds) when seconds > 0 do
    IO.puts seconds
    :timer.sleep(1000)
    countdown(seconds - 1)
  end
  def countdown(0), do: IO.puts "Tempo esgotado!"
end

Timer.countdown(10)
