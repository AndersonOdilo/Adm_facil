class AdministrativoController < ApplicationController
	before_filter :usuario_admin
	
  def index
  end

  def relatorio
  	@pedidos = Pedido.includes(:forma_pagamento).periodo(params[:data_inicial], params[:data_final]).includes(:itens_pedidos, cliente: [:pessoa])
   	respond_to do |format|
      format.js
      format.pdf {render pdf: "Produtos"} 
    end 
  end

end
