class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def autocomplete
    @clientes = Cliente.joins("LEFT OUTER JOIN pessoas on funcoes.pessoa_id = pessoas.id where (pessoas.nome ILIKE '#{params[:term]}%')")
    clientes = []
    @clientes.each do |cliente|
      clientes <<  { value: cliente.id , label: cliente.pessoa.specific.nome}
    end
    respond_to do |format|
      format.html
      format.json {
        render json: clientes
      }
    end
  end
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.paginate(:page => params[:page])
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
    pessoa = @cliente.pessoa
    if pessoa.estado_type == 'PessoaJuridica'
      @pessoa_juridica = pessoa.specific
    else
      @pessoa_fisica = pessoa.specific
    end
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to action: "index", notice: 'Cliente was successfully created.' }
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
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
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
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:limite_credito, :pessoa_id)
    end
end
