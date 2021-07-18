defmodule Project do
  def solve(trianglesNumber) do
    {:ok, file} = File.open("saida-caracteres.txt", [:write])

    Triangle.new(trianglesNumber, [' ', 'O', '-'])
    |> generateImage(trianglesNumber)
    |> Matrix.put(file)

    File.close(file)
  end

  defp multiply(number) do
    if number < 6 do
      trunc(:math.pow(2, 6-number))
    else
      1
    end
  end

  def generateImage(data, trianglesNumber) do

    multiplicador = multiply(trianglesNumber)

    bitmap = defineBitmap(data, multiplicador)

    height = length(List.first(bitmap)) * length(bitmap)
    width = length(List.first(List.first(List.first(bitmap)))) * length(List.first(List.first(bitmap)))
    bitmap = bitmap |> List.flatten()

    pngex =
      Pngex.new()
      |> Pngex.set_type(:rgb)
      |> Pngex.set_depth(:depth8)
      |> Pngex.set_size(trunc(width), trunc(height))

    image = Pngex.generate(pngex, bitmap)

    File.write("saida-imagem.png", image)

    data
  end

  def defineBitmap(imageData, multiplicador) do
    imageData
    |> Tuple.to_list()
    |> Enum.map(fn tuple -> tuple |> Tuple.to_list() end)
    |> Enum.map(
      fn line ->
        line = line
        |> Enum.map(
          fn column ->
            case column do
              ' ' -> replicate(multiplicador, {66, 180, 230}) # " "
              '-' -> replicate(multiplicador, {240, 145, 61}) # "-"
              'O' -> replicate(multiplicador, {174, 216, 230}) # "O"
            end
          end
        )

        replicate(multiplicador, line)
      end
    )
  end

  defp replicate(number, item) do
    for _ <- 0..number-1, do: item
  end
end
