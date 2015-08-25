class CargosController < ApplicationController

  # GET /cargos/new
  def new
    @cargo = Cargo.new
  end

  # POST /cargos
  # POST /cargos.json
  def create
    @cargo = Cargo.new(cargo_params)
    if @cargo.save
      render :show, status: :created, location: @cargo 
    else
      render json: @cargo.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:descricao)
    end
end
