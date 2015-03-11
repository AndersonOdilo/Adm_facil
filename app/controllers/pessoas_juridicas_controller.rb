
class PessoasJuridicasController < ApplicationController
  before_action :set_pessoa_juridica, only: [:show, :edit, :update, :destroy]

  # GET /pessoas_juridicas
  # GET /pessoas_juridicas.json
  def index
    @pessoas_juridicas = PessoaJuridica.all
  end

  # GET /pessoas_juridicas/1
  # GET /pessoas_juridicas/1.json
  def show
  end

  # GET /pessoas_juridicas/new
  def new
    @pessoa_juridica = PessoaJuridica.new
    @pessoa_juridica.fones.build
    @pessoa_juridica.emails.build
    @pessoa_juridica.enderecos.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pessoas_juridicas/1/edit
  def edit
  end

  # POST /pessoas_juridicas
  # POST /pessoas_juridicas.json
  def create
    @pessoa_juridica = PessoaJuridica.new(pessoa_juridica_params)

    respond_to do |format|
      if @pessoa_juridica.save
        format.html { redirect_to @pessoa_juridica, notice: 'Pessoa juridica was successfully created.' }
        format.json { render json: @pessoa_juridica.acting_as }
      else
        format.html { render :new }
        format.json { render json: @pessoa_juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas_juridicas/1
  # PATCH/PUT /pessoas_juridicas/1.json
  def update
    respond_to do |format|
      if @pessoa_juridica.update(pessoa_juridica_params)
        format.html { redirect_to @pessoa_juridica, notice: 'Pessoa juridica was successfully updated.' }
        format.json { render json: @pessoa_juridica.acting_as }
      else
        format.html { render :edit }
        format.json { render json: @pessoa_juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas_juridicas/1
  # DELETE /pessoas_juridicas/1.json
  def destroy
    @pessoa_juridica.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_juridicas_url, notice: 'Pessoa juridica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa_juridica
      @pessoa_juridica = PessoaJuridica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_juridica_params
      params.require(:pessoa_juridica).permit(:nome, :nome_fantasia, :cnpj, :inscricao_estadual, :data_abertura,
        pessoa_attributes: [:id, :nome, :_destroy, fones_attributes: [:id, :numero, :_destroy],
          emails_attributes: [:id, :descricao, :_destroy], enderecos_attributes: [:id, :numero, :complemento, :logradouro_id, :_destroy]])
    end
end
