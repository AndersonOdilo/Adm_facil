class DespesasController < ApplicationController
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @despesas = Despesa.all
    respond_with(@despesas)
  end

  def show
    respond_with(@despesa)
  end

  def new
    @despesa = Despesa.new
    respond_with(@despesa)
  end

  def edit
  end

  def create
    @despesa = Despesa.new(despesa_params)
    @despesa.save
    @despesa.gerar_duplicatas(params[:valor_entrada].to_f, params[:numero_parcela].to_i, params[:intervalo_parcela].to_i, params[:valor].to_f)
    respond_with(@despesa)
  end

  def update
    @despesa.update(despesa_params)
    respond_with(@despesa)
  end

  def destroy
    @despesa.destroy
    respond_with(@despesa)
  end

  private
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    def despesa_params
      params.require(:despesa).permit(:descricao, :tipo_despesa_id, :forma_pagamento_id)
    end
end
