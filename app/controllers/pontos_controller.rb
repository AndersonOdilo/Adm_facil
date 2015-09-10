class PontosController < ApplicationController

  def registro
  end

  def save
    funcionario = Funcionario.where(cod: params[:chave]).limit(1).first
    if !funcionario.nil?
      ponto = funcionario.pontos.last
      if ponto.nil? or !ponto.data_saida.nil?
        ponto = Ponto.new(funcionario_id: funcionario.id, data_entrada: Date.current, hora_entrada: Time.current)
      elsif ponto.data_saida.nil?
        ponto.data_saida = Date.current
        ponto.hora_saida = Time.current
      end
      if ponto.save!
        render json: "#{funcionario.pessoa.nome} ponto registrado".to_json
      else
        render json: "Por Favor tente novamente".to_json
      end
    else
      render json: "Chaveiro não cadastrado".to_json
    end
  end

end
