class MarcasController < ApplicationController

  def new
    @marca = Marca.new
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(marca_params)
    if @marca.save
      render json: @marca
    else
      render json: @marca.errors, status: :unprocessable_entity 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_params
      params.require(:marca).permit(:nome)
    end
end
