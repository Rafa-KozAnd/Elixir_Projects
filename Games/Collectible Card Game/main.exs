defmodule Card do
  defstruct [:id, :name, :rarity, :attack, :defense]
end

defmodule Player do
  defstruct [:name, :deck]
end
