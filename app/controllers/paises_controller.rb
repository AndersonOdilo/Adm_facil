class PaisesController < ApplicationController

	def buscar_estados
		render json: Pais.find(params[:id]).estados
	end

end