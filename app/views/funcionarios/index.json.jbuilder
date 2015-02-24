json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :cod, :carteira_trabalho, :salario, :data_admissao
  json.url funcionario_url(funcionario, format: :json)
end
