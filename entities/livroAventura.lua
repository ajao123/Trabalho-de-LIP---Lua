local livro = require("entities/livro")
local livroAventura = {}

function livroAventura.novo(categoria, id, titulo, valor, quantidade, ilustracoes, status)

	local livroAventura = livro.novo(categoria, id, titulo, valor, quantidade, status)
	livroAventura.ilustracoes = ilustracoes
	return livroAventura
end


return livroAventura
