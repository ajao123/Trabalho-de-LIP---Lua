
local livroAventura = require("entities/livroAventura")
local livroDrama = require("entities/livroDrama")
local livroComedia = require("entities/livroComedia")

local livros = {}
local categorias = {"aventura", "drama", "comedia"}

local gerenciador = {

	list = function(lista)
		livros = lista
	end,

	rst = function()
		print(livros[2])
	end,

	printMenu = function()
		print("\n\n 1 - Adicionar Livro")
		print(" 2 - Visualizar Livros")
		print(" 3 - Visualizar Estoque de livros")
		print(" 4 - Vender Livro")
		print(" 5 - Desativar vendas do livro")
		print(" 6 - Ativar vendas do livro")
		print(" 7 - Adicionar mais volumes de um livro")
		print(" 8 - Sair do Sistema")
	end,

	addLivro = function()

		print("\n 1 - Adicionar Livro de Aventura")
		print(" 2 - Adicionar Livro de Drama")
		print(" 3 - Adicionar Livro de Comédia\n")

		opcao = io.read()

			print("\n Digite o titulo do livro:")

				titulo = io.read()

			print("\n Digite o valor do livro:")

				valor = io.read()

			print("\n Digite a quantidade de volumes do livro adicionado:")

				quantidade = io.read()


		if(opcao == "1") then



			print("\n Ilustracoes ? s ou n:")

				ilustracoes = io.read()

				if(ilustracoes == "s") then
					ilustracoes = true
				else
					ilustracoes = false
				end

			livros[#livros+1] = livroAventura.novo(categorias[1], #livros+1, titulo, valor, tonumber(quantidade), ilustracoes, true)

		else
			if(opcao == "2") then

				categoria =  categorias[2]


				print("\n Capa dura ? s ou n:")

					capaDura = io.read()

					if(capaDura == "s") then
						capaDura = true
					else
						capaDura = false
					end

				livros[#livros+1] = livroDrama.novo(categorias[2], #livros+1, titulo, valor, tonumber(quantidade), capaDura, true)

			else

				if(opcao == "3") then

					categoria = categorias[3]

					print("\n Capa Brochura ? s ou n:")

						capaDura = io.read()

						if(capaDura == "s") then
							capaBrochura = true
						else
							capaBrochura = false
						end

					livros[#livros+1] = livroComedia.novo(categorias[3], #livros+1, titulo, valor, tonumber(quantidade), capaBrochura, true)

				end

			end
		end

	end,

	printLivros = function()

		for i = 1, #livros, 1 do
			print("\t Livro - " .. livros[i].id)
			print(" Id - " .. livros[i].id)
			print(" Titulo - " .. livros[i].titulo)
			print(" Categoria - " .. livros[i].categoria)
			print(" Valor - " .. livros[i].valor)
			print(" Quantidade Em Estoque - " .. livros[i].quantidade)

			if(livros[i].status == true) then
				print(" Status - Ativo")
			else
				print(" Status - Inativo")
			end

			if(livros[i].categoria == categorias[1]) then
				if(livros[i].ilustracoes == true) then
					print(" Ilustracoes - Sim \n")
				else
					print(" Ilustracoes - Nao \n")
				end
			else
				if(livros[i].categoria == categorias[2]) then
					if(livros[i].capaDura == true) then
						print(" Capa Dura - Sim \n")
					else
						print(" Capa Dura - Nao \n")
					end
				else
					if(livros[i].categoria == categorias[3]) then
						if(livros[i].capaBrochura == true) then
							print(" Capa Brochura - Sim \n")
						else
							print(" Capa Brochura - Nao \n")
						end
					end
				end

			end
		end

	end,

	visualizarPorCategoria = function()
		for j = 1, 3, 1 do
			print("\t Categoria: " .. categorias[j] .. "\n")

			for i = 1, #livros, 1 do

				if(livros[i].categoria == categorias[j] ) then

					print("\t Livro - " .. livros[i].id)
					print(" Id - " .. livros[i].id)
					print(" Titulo - " .. livros[i].titulo)
					print(" Categoria - " .. livros[i].categoria)
					print(" Valor - " .. livros[i].valor)
					print(" Quantidade Em Estoque - " .. livros[i].quantidade)

					if(livros[i].status == true) then
						print(" Status - Ativo")
					else
						print(" Status - Inativo")
					end

					if(livros[i].categoria == categorias[1]) then
						if(livros[i].ilustracoes == true) then
							print(" Ilustracoes - Sim \n")
						else
							print(" Ilustracoes - Nao \n")
						end
					else
						if(livros[i].categoria == categorias[2]) then
							if(livros[i].capaDura == true) then
								print(" Capa Dura - Sim \n")
							else
								print(" Capa Dura - Nao \n")
							end
						else
							if(livros[i].categoria == categorias[3]) then
								if(livros[i].capaBrochura == true) then
									print(" Capa Brochura - Sim \n")
								else
									print(" Capa Brochura - Nao \n")
								end
							end
						end

					end

				end



			end
		end
	end,

	venderLivro = function()

		print("\n Digite o id do livro desejado:")

		idLivro = tonumber(io.read())

		if(idLivro <= #livros and idLivro > 0) then

			if(livros[idLivro].status == true) then

				if(livros[idLivro].quantidade == 0) then
					print("\n Livro Esgotado")
				else
					livros[idLivro].quantidade = livros[idLivro].quantidade -1
					print("\n Venda Realizada com Sucesso")
				end

			else

				print("\n Livro Indisponível para a venda.")

			end


		else
			print("\n Livro não encontrado. Id inválido.")
		end

	end,

	desativarVendasLivro = function()

		print("\n Digite o id do livro desejado:\n")
		idLivro = tonumber(io.read())

		if(idLivro <= #livros and idLivro > 0) then

			if(livros[idLivro].status == true) then

				livros[idLivro].status = false
				print("\n Livro esta Indisponível para venda. Inativo")

			else

				print("\n Livro ja esta inativo.")

			end


		else
			print("\n Livro não encontrado. Id inválido.")
		end

	end,

	ativarVendasLivro = function()

		print("\n Digite o id do livro desejado:")
		idLivro = tonumber(io.read())

		if(idLivro <= #livros and idLivro > 0) then

			if(livros[idLivro].status == false) then

				livros[idLivro].status = true
				print("\n Livro esta disponível para venda. Ativo")

			else

				print("\n Livro ja esta ativo.")

			end


		else
			print("\n Livro não encontrado. Id inválido.")
		end

	end,

	adicionarMaisVolumes = function()
		print("\n Digite o id do livro desejado:")
		idLivro = tonumber(io.read())

		if(idLivro <= #livros and idLivro > 0) then

			print("\n Digite a quantidade de volumes a ser adicionada:")
			qtdLivro = tonumber(io.read())

			if(qtdLivro > 0) then
				livros[idLivro].quantidade = livros[idLivro].quantidade + qtdLivro
				print("\n Volumes adicionados com sucesso.")
			else
				print("\n Quantidade invalida.")
			end


		else
			print("\n Livro não encontrado. Id inválido.")
		end
	end





}

return gerenciador
