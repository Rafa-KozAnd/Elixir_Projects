defmodule Game do
  import Spaceship
  import Alien

  def start do
    spaceship = Spaceship.create("Minha Nave")
    alien = Alien.create("Inimigo")

    IO.puts "Bem-vindo ao Jogo de Aventura Espacial!"
    loop(spaceship, alien)
  end

  defp loop(spaceship, alien) do
    IO.puts "\nEstado Atual da Nave:"
    IO.puts Spaceship.status(spaceship)

    IO.puts "\nEstado Atual do Alien:"
    IO.puts Alien.status(alien)

    action_menu()
    |> handle_action(spaceship, alien)
    |> next_turn()
  end

  defp action_menu do
    IO.puts "\nEscolha uma ação:"
    IO.puts "1. Voar"
    IO.puts "2. Atirar"
    IO.puts "3. Sair"
    IO.gets |> String.trim |> String.to_integer
  end

  defp handle_action(1, spaceship, alien) do
    new_spaceship = Spaceship.fly(spaceship)
    IO.puts "#{spaceship.name} voou para frente!"
    loop(new_spaceship, alien)
  end

  defp handle_action(2, spaceship, alien) do
    new_alien = Alien.attack(alien)
    IO.puts "#{alien.type} atacou a nave!"
    loop(spaceship, new_alien)
  end

  defp handle_action(3, _, _) do
    IO.puts "Saindo do jogo..."
  end

  defp handle_action(_, spaceship, alien) do
    IO.puts "Ação inválida!"
    loop(spaceship, alien)
  end

  defp next_turn(:ok) do
    :ok
  end
end
