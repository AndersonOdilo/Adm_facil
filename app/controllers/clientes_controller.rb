class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def autocomplete
    clientes = Cliente.joins("LEFT OUTER JOIN pessoas on pessoa_id = pessoas.id where (pessoas.nome ILIKE '%#{params[:term]}%')")
    clientes_json = []
    clientes.collect{|cliente| clientes_json <<  { id: cliente.id , value: cliente.pessoa.specific.nome}}
    render json: clientes_json
  end

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.includes(:pessoa)
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente.pessoa = @cliente.pessoa.specific
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new
    if params[:type] == "PessoaFisica"
      @cliente.pessoa = PessoaFisica.new
    else
      @cliente.pessoa = PessoaJuridica.new
    end
    @cliente.assign_attributes(cliente_params)
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to action: "index"}
        format.json { render json: @cliente.to_json(include: [:pessoa]) }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    @cliente.pessoa = @cliente.pessoa.specific
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente alterado com sucesso"}
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente excluido com sucesso"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.includes(pessoa: [:fones, :enderecos, :emails]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:limite_credito,
        pessoa_attributes: [:id, :nome, :cpf, :rg, :data_nascimento, :nome_fantasia, :cnpj, :inscricao_estadual, :data_abertura,
          enderecos_attributes: [:id, :logradouro, :bairro, :numero, :complemento, :cep, :_destroy],
          fones_attributes: [:id, :numero, :_destroy],
          emails_attributes: [:id, :descricao, :_destroy]])
    end
end
