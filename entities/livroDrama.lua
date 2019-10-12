local livro = require("entities/livro")
local livroDrama = {}

function livroDrama.novo(categoria, id, titulo, valor, quantidade, capaDura, status)

	local livroDrama = livro.novo(categoria, id, titulo, valor, quantidade, status)
	livroDrama.capaDura = capaDura
	return livroDrama
end


return livroDrama
