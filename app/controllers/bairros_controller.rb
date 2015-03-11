class BairrosController < ApplicationController

    def buscar_ruas
        respond_to do |format|
            format.json {render json: Bairro.find(params[:id]).logradouros }
        end
    end
end