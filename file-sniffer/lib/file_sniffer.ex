defmodule FileSniffer do
  @media_types %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  def type_from_extension(extension), do: @media_types[extension]

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>), do: @media_types["exe"]
  def type_from_binary(<<0x42, 0x4D, _::binary>>), do: @media_types["bmp"]

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>),
    do: @media_types["png"]

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>), do: @media_types["jpg"]
  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>), do: @media_types["gif"]

  def verify(file_binary, extension) do
    type = type_from_binary(file_binary)

    case type == type_from_extension(extension) do
      true -> {:ok, type}
      false -> {:error, "Warning, file format and file extension do not match."}
    end
  end
end
