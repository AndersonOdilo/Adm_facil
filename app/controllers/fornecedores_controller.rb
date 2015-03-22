class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.includes(funcao: :pessoa).paginate(page: params[:page], per_page: 10)
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
      pessoa = @fornecedor.funcao.pessoa
      if pessoa.estado_type == 'PessoaJuridica'
        @pessoa_juridica = pessoa.specific
      else
        @pessoa_fisica = pessoa.specific
      end
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    respond_to do |format|
      if @fornecedor.save
        flash[:success] = "Fornecedor cadastrado com sucesso."
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
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        flash[:success] = "Fornecedor alterado com sucesso."
        format.html { redirect_to @fornecedor}
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      flash[:success] = "Fornecedor excluido com sucesso."
      format.html { redirect_to fornecedores_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.includes(funcao: [pessoa: [:fones, :enderecos, :emails]]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:id, :pessoa_id)
    end
end
