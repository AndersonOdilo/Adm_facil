class EnderecosController < ApplicationController

  # GET /enderecos/new
  def new
    @endereco = Endereco.new
    render locals: {pessoa: params[:pessoa]}
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(endereco_params)

    if @endereco.save
      render json: @endereco.to_json(include: {cidade: {include: {estado: {include: :pais}}}})
    else
      render json: @endereco.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def endereco_params
      params.require(:endereco).permit(:cep, :numero, :complemento, :logradouro, :bairro, :cidade_id, :pessoa_id, )
    end
end
