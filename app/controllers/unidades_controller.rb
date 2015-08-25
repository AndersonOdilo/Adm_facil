class UnidadesController < ApplicationController

  # GET /unidades/new
  def new
    @unidade = Unidade.new
  end

  # POST /unidades
  # POST /unidades.json
  def create
    @unidade = Unidade.new(unidade_params)
    if @unidade.save
      render json: @unidade 
    else
      render json: @unidade.errors, status: :unprocessable_entity 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_params
      params.require(:unidade).permit(:descricao, :sigla)
    end
end
