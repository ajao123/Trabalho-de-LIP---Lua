local livro = {}

function livro.novo(categoria, id, titulo, valor, quantidade, status)
	return{
		categoria = categoria,
		id = id,
		titulo = titulo,
		valor = valor,
		quantidade = quantidade,
		status = status
	}
end

return livro
