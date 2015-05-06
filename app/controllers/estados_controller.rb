class EstadosController < ApplicationController

  def buscar_cidades
    render json: Estado.find(params[:id]).cidades
  end

end