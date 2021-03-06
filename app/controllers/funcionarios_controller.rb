class FuncionariosController < ApplicationController
  before_filter :usuario_admin
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.includes(:pessoa, :cargo)
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.pessoa= PessoaFisica.new
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario.pessoa = @funcionario.pessoa.specific
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new
    @funcionario.pessoa = PessoaFisica.new
    @funcionario.assign_attributes(funcionario_params)
    if  @funcionario.save
      flash[:notice] = "Funcionario salvo com sucesso"
      redirect_to actions: "index"
    else
      render :new
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    @funcionario.pessoa = @funcionario.pessoa.specific
    if @funcionario.update(funcionario_params)
      flash[:notice] = "Funcionario alterado com sucesso"
      redirect_to @funcionario
    else
      render :edit
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    flash[:notice] = "Funcionario excluido com sucesso"
    redirect_to funcionarios_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:cod, :carteira_trabalho, :salario, :data_admissao, :pessoa_id,
        :cargo_id, :carga_horaria, usuario_attributes: [:email, :password, :funcionario_id, :_destroy],
          pessoa_attributes: [:id, :nome, :cpf, :rg, :data_nascimento, :nome_fantasia, :cnpj, :inscricao_estadual, :data_abertura,
          enderecos_attributes: [:id, :logradouro, :bairro, :numero, :complemento, :cidade_id, :cep, :_destroy],
          fones_attributes: [:id, :numero, :_destroy],
          emails_attributes: [:id, :descricao, :_destroy]])
    end
end
