local livroAventura = require("entities/livroAventura")
local livroDrama = require("entities/livroDrama")
local livroComedia = require("entities/livroComedia")
local gerenciador = require("entities/gerenciador")


sair = false

gerenciador.printMenu()

repeat

	print(" 9 - Para visualizar o menu novamente \n")
	opcao = io.read()

	if(opcao == "9") then

		gerenciador.printMenu()

	else

		if(opcao == "1") then

			gerenciador.addLivro()

		else

			if(opcao == "2") then

				gerenciador.printLivros()

			else

				if(opcao == "3") then

					gerenciador.visualizarPorCategoria()

				else

					if(opcao == "4") then

						gerenciador.venderLivro()

					else

						if(opcao == "5") then


							gerenciador.desativarVendasLivro()

						else

							if(opcao == "6") then

								gerenciador.ativarVendasLivro()

							else

								if(opcao == "7") then
									gerenciador.adicionarMaisVolumes()

								else

									if(opcao == "8") then
										print("\n Saindo do Sistema !!!")
										sair = true
									end

								end

							end

						end

					end

				end

			end

		end

	end

until sair == true
