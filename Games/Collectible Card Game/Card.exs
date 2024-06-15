defmodule Card do
  defstruct name: "", type: "", power: 0

  def create(name, type, power) do
    %__MODULE__{name: name, type: type, power: power}
  end
end
