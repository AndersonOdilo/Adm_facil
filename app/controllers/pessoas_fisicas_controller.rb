class PessoasFisicasController < ApplicationController
  before_action :set_pessoa_fisica, only: [:show, :edit, :update, :destroy]

  # GET /pessoas_fisicas
  # GET /pessoas_fisicas.json
  def index
    @pessoas_fisicas = PessoaFisica.all
  end

  # GET /pessoas_fisicas/1
  # GET /pessoas_fisicas/1.json
  def show
  end

  # GET /pessoas_fisicas/new
  def new
    @pessoa_fisica = PessoaFisica.new
    @pessoa_fisica.fones.build
    @pessoa_fisica.emails.build
    @pessoa_fisica.enderecos.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pessoas_fisicas/1/edit
  def edit
  end

  # POST /pessoas_fisicas
  # POST /pessoas_fisicas.json
  def create
    @pessoa_fisica = PessoaFisica.new(pessoa_fisica_params)

    respond_to do |format|
      if @pessoa_fisica.save
        format.html { redirect_to @pessoa_fisica, notice: 'Pessoa fisica was successfully created.' }
        format.json { render json: @pessoa_fisica.acting_as}
      else
        format.html { render :new }
        format.json { render json: @pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas_fisicas/1
  # PATCH/PUT /pessoas_fisicas/1.json
  def update
    respond_to do |format|
      if @pessoa_fisica.update(pessoa_fisica_params)
        format.html { redirect_to @pessoa_fisica, notice: 'Pessoa fisica was successfully updated.' }
        format.json { render json: @pessoa_fisica.acting_as }
      else
        format.html { render :edit }
        format.json { render json: @pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas_fisicas/1
  # DELETE /pessoas_fisicas/1.json
  def destroy
    @pessoa_fisica.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_fisicas_url, notice: 'Pessoa fisica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa_fisica
      @pessoa_fisica = PessoaFisica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_fisica_params
      params.require(:pessoa_fisica).permit(:nome, :cpf, :rg, :data_nascimento, pessoa_attributes: [:id,
              fones_attributes: [:id, :numero, :_destroy], emails_attributes: [:id, :descricao, :_destroy],
                enderecos_attributes: [:id, :numero, :complemento, :logradouro_id, :_destroy]])
    end
end
