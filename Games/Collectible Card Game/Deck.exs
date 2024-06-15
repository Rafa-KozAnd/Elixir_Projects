defmodule Game do
  def create_player(name, deck) do
    %Player{name: name, deck: deck}
  end
end

# Exemplo de jogador com um deck de cartas
deck = [card1, card2, card3]
player = Game.create_player("Jogador 1", deck)
