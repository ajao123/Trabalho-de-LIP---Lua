local livro = require("entities/livro")
local livroComedia = {}

function livroComedia.novo(categoria, id, titulo, valor, quantidade, capaBrochura, status)

	local livroComedia = livro.novo(categoria, id, titulo, valor, quantidade, status)
	livroComedia.capaBrochura = capaBrochura
	return livroComedia

end


return livroComedia
