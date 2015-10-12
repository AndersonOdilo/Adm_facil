class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.includes(:pessoa)
  end

  # GET /fornecedores/1
  # GET /fornecedores/1.json
  def show
  end

  # GET /fornecedores/new
  def new
    @fornecedor = Fornecedor.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /fornecedores/1/edit
  def edit
    @fornecedor.pessoa = @fornecedor.pessoa.specific
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new
    if params[:type] == "PessoaFisica"
      @fornecedor.pessoa = PessoaFisica.new
    else
      @fornecedor.pessoa = PessoaJuridica.new
    end
    @fornecedor.assign_attributes(fornecedor_params)
    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to action: "index"}
        format.json { render json: @fornecedor.to_json(include: [:pessoa]) }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    @fornecedor.pessoa = @fornecedor.pessoa.specific
    if @fornecedor.update(fornecedor_params)
      flash[:notice] = "Fornecedor alterado com sucesso"
      redirect_to @fornecedor
    else
      render :edit 
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    @fornecedor.destroy
    flash[:notice] = "Fornecedor excluido com sucesso"
    redirect_to fornecedores_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.includes(pessoa: [:fones, :enderecos, :emails]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:id,
        pessoa_attributes: [:id, :nome, :cpf, :rg, :data_nascimento, :nome_fantasia, :cnpj, :inscricao_estadual, :data_abertura,
          enderecos_attributes: [:id, :logradouro, :bairro, :numero, :complemento, :cep, :_destroy],
          fones_attributes: [:id, :numero, :_destroy],
          emails_attributes: [:id, :descricao, :_destroy]])
    end
end
