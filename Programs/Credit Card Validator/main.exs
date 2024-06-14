defmodule CreditCardValidator do
  def validate(card_number) when is_binary(card_number) do
    card_number
    |> String.trim()
    |> String.replace(~r/\s+/, "")
    |> String.to_integer()
    |> to_digits()
    |> Enum.reverse()
    |> luhn_algorithm()
  end

  defp to_digits() do
    fn number ->
      number
      |> Integer.to_string()
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
    end
  end

  defp luhn_algorithm(digits) do
    {checksum, _} = Enum.reduce(digits, {0, 0}, fn digit, {sum, index} ->
      if rem(index, 2) == 0 do
        double = digit * 2
        sum + (if double > 9, do: double - 9, else: double)
      else
        sum + digit
      end
      |> {&1, index + 1}
    end)

    rem(checksum, 10) == 0
  end
end

# Exemplo de uso:
card_number = "4532015112830366"
if CreditCardValidator.validate(card_number) do
  IO.puts "#{card_number} é um número de cartão de crédito válido."
else
  IO.puts "#{card_number} é um número de cartão de crédito inválido."
end
