class AdministrativoController < ApplicationController
  def index
  end

  def relatorio
  	@pedidos = Pedido.periodo(params[:data_inicial], params[:data_final]).includes(:itens_pedidos, cliente: [:pessoa])
  	respond_to do |format|
  		format.html
  		format.pdf {render pdf: 'Financeiro'}
  	end
  end

end
