class CidadesController < ApplicationController

  def buscar_ruas
    render json: Cidade.find(params[:id]).logradouros
  end

end