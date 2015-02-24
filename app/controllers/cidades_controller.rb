class CidadesController < ApplicationController

    def buscar_bairros
        respond_to do |format|
            format.json {render json: Cidade.find(params[:id]).bairros}
        end
    end
end