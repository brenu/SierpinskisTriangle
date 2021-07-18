# Sierpiński's Triangle

Implementação do Triângulo de Sierpiński utilizando o paradigma funcional através do Elixir

## Integrantes

Ariel Narciso, Breno Moreira Gonçalves, Breno Vitório de Sousa e Daniel Jackson Cavalcante Costa.

## Como executar?

No terminal, tendo o iex instalado, vá até o diretório base do projeto e insira o seguinte comando para instalar as dependências necessárias:

```console
foo@bar:~$ mix deps.get
```

Após isso, execute o comando abaixo para rodar o projeto:

```console
foo@bar:~$ iex -S mix run main.exs
```

Uma vez aberto o projeto, é possível interagir inserindo o número de triângulos desejados. É importante ressaltar que o programa irá solicitar novos casos até que você digite um número negativo, quando a execução será encerrada.


## Saída

Caso o algoritmo obtenha os resultados, duas saídas serão criadas. Uma delas é a saída em caracteres, que se fará presente num arquivo chamado "saida-caracteres.txt", logo na raíz do projeto. A segunda saída é uma saída gráfica, que poderá ser encontrada no arquivo "saida-imagem.png"