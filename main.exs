defmodule Main do
  def main() do
    {:ok, [trianglesNumber]} = :io.fread('Insira o número de repetições: ', '~d ')

    if trianglesNumber >= 0 do
      IO.puts("\n\n[*] Calculando, aguarde...")
      Project.solve(trianglesNumber)

      IO.puts("\n[*] Concluído. Resultados disponíveis nos arquivos 'saida-caracteres.txt' e 'saida-imagem.png'\n\n")
      main()
    end

    IO.puts(:interrupted)
  end


end

Main.main()
