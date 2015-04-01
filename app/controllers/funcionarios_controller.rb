class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.includes(funcao: :pessoa).paginate(page: params[:page], per_page: 10)
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.funcao = Funcao.new
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario.pessoa = @funcionario.pessoa.specific
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new
    if params[:type] == "PessoaFisica"
      @funcionario.pessoa = PessoaFisica.new
    else
      @funcionario.pessoa = PessoaJuridica.new
    end
    @funcionario.update(cliente_params)

    respond_to do |format|
      if @funcionario.save
        flash[:success] = "Funcionario cadastrado com sucesso."
        format.html { redirect_to actions: "index"}
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    @funcionario.pessoa = @funcionario.pessoa.specific
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        flash[:success] = "Funcionario alterado com sucesso."
        format.html { redirect_to @funcionario}
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      flash[:success] = "Funcionario excluido com sucesso."
      format.html { redirect_to funcionarios_url, success: 'Funcionario excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.includes(funcao: [pessoa: [:fones, :enderecos, :emails]]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:cod, :carteira_trabalho, :salario, :data_admissao, :pessoa_id,
        :cargo_id, :carga_horaria, usuario_attributes: [:email, :password, :funcionario_id, :_destroy],
          funcao_attributes: [:id, :pessoa_id,
          pessoa_attributes: [:id, :nome, :cpf, :rg, :data_nascimento, :nome_fantasia, :cnpj, :inscricao_estadual, :data_abertura,
          enderecos_attributes: [:id, :logradouro_id, :numero, :complemento, :_destroy],
          fones_attributes: [:id, :numero, :_destroy],
          emails_attributes: [:id, :descricao, :_destroy]]])
    end
end
