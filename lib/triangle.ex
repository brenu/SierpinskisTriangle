defmodule Matrix do

	def new(n, char) do
		new(n, 2 * n - 1, char)
	end

	def new(0, _columns, _char) do {} end
	def new(rows, columns, char) do
		new(rows - 1, columns, char)
		|> Tuple.append(new_line(columns, char))
	end

	def new_line(0, _char) do {} end
	def new_line(n, char) do
		Tuple.append(new_line(n - 1, char), char)
	end

	def set_line(t, [i], char) do
		put_elem(t, i, char)
	end
	def set_line(t, [i | indices], char) do
		set_line(t, indices, char)
		|> put_elem(i, char)
	end

	def put(matrix, file) do
		put(matrix, 0, file)
	end
	def put(matrix, n, _) when n >= tuple_size(matrix) do end
	def put(matrix, n, file) do
		elem =
		elem(matrix, n)
		|> Tuple.to_list()
		|> to_string()

		IO.write(file, elem <> "\n")

		put(matrix, n + 1, file)
	end

end

defmodule Triangle do

	def new(n, [char0, char1, char2]) do
		size = trunc(:math.pow(2, n + 2))
		init(size, char0, char1)
		|> new(size - 1, div(size, 2), size - 1, n, char2)
	end

	def init(n, charOut, charIn) do
		Matrix.new(n, charOut)
		|> init(charIn, n - 1, 0, 2 * n - 2)
	end
	def init(matrix, char, 0, i, j) do
		put_elem(matrix, 0, Matrix.set_line(elem(matrix, 0), Enum.to_list(i..j), char))
	end
	def init(matrix, char, n, i, j) do
		init(matrix, char, n - 1, i + 1, j - 1)
		|> put_elem(
			n, elem(matrix, n)
			|> Matrix.set_line(Enum.to_list(i..j), char)
		)
	end

	def new(matrix, _row, _triangle_height, _middle_column, 0, _char) do
		matrix
	end
	def new(matrix, row, triangle_height, middle_column, lvl, char) do
		new(
			matrix, row, div(triangle_height, 2),
			middle_column - triangle_height,
			lvl - 1, char
		) # left
		|> new(
			row, div(triangle_height, 2),
			middle_column + triangle_height,
			lvl - 1, char
		) # right
		|> new(
			row - triangle_height, div(triangle_height, 2),
			middle_column, lvl - 1, char
		) # top
		|> new_line(row, triangle_height, middle_column, middle_column, char)
	end

	def new_line(matrix, _row, 0, _i, _j, _char) do
		matrix
	end
	def new_line(matrix, row, count, i, j, char) do
		new_line(matrix, row - 1, count - 1, i - 1, j + 1, char)
		|> put_elem(row, Matrix.set_line(elem(matrix, row), Enum.to_list(i..j), char))
	end

end
