class BairrosController < ApplicationController

  def buscar_ruas
    render json: Bairro.find(params[:id]).logradouros
  end

end