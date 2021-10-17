defmodule DNA do
  @acids %{?\s => 0b0000, ?A => 0b0001, ?C => 0b0010, ?G => 0b0100, ?T => 0b1000}

  def encode_nucleotide(code_point), do: @acids[code_point]

  def decode_nucleotide(encoded_code) do
    {key, _} = Enum.find(@acids, nil, fn {_, code} -> code == encoded_code end)
    key
  end

  def encode(dna),
    do: Enum.map(dna, &encode_nucleotide(&1)) |> List.foldr(<<0::0>>, &<<&1::4, &2::bitstring>>)

  def decode(dna), do: do_decode(dna, []) |> Enum.reverse()

  defp do_decode(<<0::0>>, acc), do: acc

  defp do_decode(<<value::4, rest::bitstring>>, acc),
    do: do_decode(rest, [decode_nucleotide(value) | acc])
end
