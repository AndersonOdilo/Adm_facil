class CidadesController < ApplicationController

  def buscar_bairros
    render json: Cidade.find(params[:id]).bairros
  end

end