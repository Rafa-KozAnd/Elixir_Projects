defmodule Device do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    {:ok, name}
  end

  def handle_info({:send_message, to, message}, state) do
    IO.puts "Enviando mensagem de #{state} para #{to}: #{message}"
    Network.send_message(state, to, message)
    {:noreply, state}
  end
end

defmodule Network do
  def send_message(from, to, message) do
    IO.puts "Recebendo mensagem em #{to} de #{from}: #{message}"
    # Aqui você poderia adicionar lógica adicional, como filtrar mensagens, encaminhamento, etc.
  end
end
