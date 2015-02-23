class EstadosController < ApplicationController

  def buscar_cidades
    respond_to do |format|
      format.json { render json: Estado.find(params[:id]).cidades }
    end
  end
end