# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151101215750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias_produtos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.decimal  "limite_credito"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "clientes", ["pessoa_id"], name: "index_clientes_on_pessoa_id", using: :btree

  create_table "despesas", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "tipo_despesa_id"
    t.integer  "forma_pagamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "despesas", ["forma_pagamento_id"], name: "index_despesas_on_forma_pagamento_id", using: :btree
  add_index "despesas", ["tipo_despesa_id"], name: "index_despesas_on_tipo_despesa_id", using: :btree

  create_table "despesas_pagamentos", force: :cascade do |t|
    t.date     "data_vencimento"
    t.date     "data_pagamento"
    t.decimal  "valor",           precision: 15, scale: 2
    t.integer  "despesa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "despesas_pagamentos", ["despesa_id"], name: "index_despesas_pagamentos_on_despesa_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "emails", ["pessoa_id"], name: "index_emails_on_pessoa_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "numero"
    t.string   "complemento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
    t.string   "bairro"
    t.integer  "cidade_id"
    t.string   "logradouro"
    t.string   "cep"
  end

  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree
  add_index "enderecos", ["pessoa_id"], name: "index_enderecos_on_pessoa_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["pais_id"], name: "index_estados_on_pais_id", using: :btree

  create_table "fones", force: :cascade do |t|
    t.string   "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "fones", ["pessoa_id"], name: "index_fones_on_pessoa_id", using: :btree

  create_table "formas_pagamentos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "parcelado"
    t.integer  "numero_parcela"
  end

  create_table "fornecedores", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "fornecedores", ["pessoa_id"], name: "index_fornecedores_on_pessoa_id", using: :btree

  create_table "funcionarios", force: :cascade do |t|
    t.string   "cod"
    t.string   "carteira_trabalho"
    t.decimal  "salario"
    t.date     "data_admissao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cargo_id"
    t.float    "carga_horaria"
    t.integer  "pessoa_id"
  end

  add_index "funcionarios", ["cargo_id"], name: "index_funcionarios_on_cargo_id", using: :btree
  add_index "funcionarios", ["pessoa_id"], name: "index_funcionarios_on_pessoa_id", using: :btree

  create_table "itens_orcamentos", force: :cascade do |t|
    t.integer  "quantidade"
    t.decimal  "preco"
    t.integer  "orcamento_id"
    t.integer  "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens_orcamentos", ["orcamento_id"], name: "index_itens_orcamentos_on_orcamento_id", using: :btree
  add_index "itens_orcamentos", ["produto_id"], name: "index_itens_orcamentos_on_produto_id", using: :btree

  create_table "itens_pedidos", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.integer  "quantidade"
    t.decimal  "preco",      precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens_pedidos", ["pedido_id"], name: "index_itens_pedidos_on_pedido_id", using: :btree
  add_index "itens_pedidos", ["produto_id"], name: "index_itens_pedidos_on_produto_id", using: :btree

  create_table "marcas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notificacaos", force: :cascade do |t|
    t.integer  "produto_id"
    t.boolean  "visualizado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notificacaos", ["produto_id"], name: "index_notificacaos_on_produto_id", using: :btree

  create_table "orcamentos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data"
    t.date     "data_validade"
    t.string   "obs"
    t.integer  "funcionario_id"
    t.integer  "cliente_id"
    t.float    "desconto"
  end

  add_index "orcamentos", ["cliente_id"], name: "index_orcamentos_on_cliente_id", using: :btree
  add_index "orcamentos", ["funcionario_id"], name: "index_orcamentos_on_funcionario_id", using: :btree

  create_table "pagamentos_vendas", force: :cascade do |t|
    t.date     "data_vencimento"
    t.date     "data_pagamento"
    t.decimal  "valor",           precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "numero_parcela"
    t.integer  "pedido_id"
  end

  add_index "pagamentos_vendas", ["pedido_id"], name: "index_pagamentos_vendas_on_pedido_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: :cascade do |t|
    t.date     "data"
    t.decimal  "desconto"
    t.string   "obs"
    t.integer  "cliente_id"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forma_pagamento_id"
    t.integer  "endereco_id"
  end

  add_index "pedidos", ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree
  add_index "pedidos", ["endereco_id"], name: "index_pedidos_on_endereco_id", using: :btree
  add_index "pedidos", ["forma_pagamento_id"], name: "index_pedidos_on_forma_pagamento_id", using: :btree
  add_index "pedidos", ["funcionario_id"], name: "index_pedidos_on_funcionario_id", using: :btree

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.string   "estado_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_fisicas", force: :cascade do |t|
    t.string   "cpf"
    t.string   "rg"
    t.date     "data_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_juridicas", force: :cascade do |t|
    t.string   "nome_fantasia"
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_abertura"
  end

  create_table "pontos", force: :cascade do |t|
    t.date     "data_entrada"
    t.time     "hora_entrada"
    t.date     "data_saida"
    t.time     "hora_saida"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pontos", ["funcionario_id"], name: "index_pontos_on_funcionario_id", using: :btree

  create_table "produtos", force: :cascade do |t|
    t.string   "cod"
    t.string   "nome"
    t.string   "descricao"
    t.decimal  "valor_custo",          precision: 15, scale: 2, null: false
    t.decimal  "valor_venda",          precision: 15, scale: 2, null: false
    t.integer  "marca_id"
    t.integer  "categoria_produto_id"
    t.integer  "fornecedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estoque_id"
    t.integer  "unidade_id"
    t.integer  "quantidade_estoque"
    t.integer  "nivel_alerta"
  end

  add_index "produtos", ["categoria_produto_id"], name: "index_produtos_on_categoria_produto_id", using: :btree
  add_index "produtos", ["estoque_id"], name: "index_produtos_on_estoque_id", using: :btree
  add_index "produtos", ["fornecedor_id"], name: "index_produtos_on_fornecedor_id", using: :btree
  add_index "produtos", ["marca_id"], name: "index_produtos_on_marca_id", using: :btree
  add_index "produtos", ["unidade_id"], name: "index_produtos_on_unidade_id", using: :btree

  create_table "tipos_despesas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", force: :cascade do |t|
    t.string   "descricao"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
