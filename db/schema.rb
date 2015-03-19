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

ActiveRecord::Schema.define(version: 20150319160309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: true do |t|
    t.string   "nome"
    t.integer  "cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bairros", ["cidade_id"], name: "index_bairros_on_cidade_id", using: :btree

  create_table "cargos", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias_produtos", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", force: true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "clientes", force: true do |t|
    t.decimal  "limite_credito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "emails", ["pessoa_id"], name: "index_emails_on_pessoa_id", using: :btree

  create_table "enderecos", force: true do |t|
    t.string   "numero"
    t.string   "complemento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
    t.integer  "logradouro_id"
  end

  add_index "enderecos", ["logradouro_id"], name: "index_enderecos_on_logradouro_id", using: :btree
  add_index "enderecos", ["pessoa_id"], name: "index_enderecos_on_pessoa_id", using: :btree

  create_table "estados", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["pais_id"], name: "index_estados_on_pais_id", using: :btree

  create_table "fones", force: true do |t|
    t.string   "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "fones", ["pessoa_id"], name: "index_fones_on_pessoa_id", using: :btree

  create_table "formas_pagamentos", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fornecedores", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionarios", force: true do |t|
    t.string   "cod"
    t.string   "carteira_trabalho"
    t.decimal  "salario"
    t.date     "data_admissao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cargo_id"
    t.float    "carga_horaria"
  end

  add_index "funcionarios", ["cargo_id"], name: "index_funcionarios_on_cargo_id", using: :btree

  create_table "funcoes", force: true do |t|
    t.integer  "pessoa_id"
    t.integer  "papel_id"
    t.string   "papel_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funcoes", ["pessoa_id"], name: "index_funcoes_on_pessoa_id", using: :btree

  create_table "itens_pedidos", force: true do |t|
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.integer  "quantidade"
    t.decimal  "preco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens_pedidos", ["pedido_id"], name: "index_itens_pedidos_on_pedido_id", using: :btree
  add_index "itens_pedidos", ["produto_id"], name: "index_itens_pedidos_on_produto_id", using: :btree

  create_table "logradouros", force: true do |t|
    t.string   "nome"
    t.string   "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "CD_TIPO_LOGRADOUROS"
    t.integer  "bairro_id"
  end

  add_index "logradouros", ["bairro_id"], name: "index_logradouros_on_bairro_id", using: :btree

  create_table "marcas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orcamentos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagamentos_vendas", force: true do |t|
    t.date     "data_vencimento"
    t.date     "data_pagamento"
    t.decimal  "valor"
    t.integer  "venda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pagamentos_vendas", ["venda_id"], name: "index_pagamentos_vendas_on_venda_id", using: :btree

  create_table "paises", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: true do |t|
    t.date     "data"
    t.decimal  "desconto"
    t.string   "obs"
    t.integer  "cliente_id"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "actable_id"
    t.string   "actable_type"
  end

  add_index "pedidos", ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree
  add_index "pedidos", ["funcionario_id"], name: "index_pedidos_on_funcionario_id", using: :btree

  create_table "pessoas", force: true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.string   "estado_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_fisicas", force: true do |t|
    t.string   "cpf"
    t.string   "rg"
    t.date     "data_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_juridicas", force: true do |t|
    t.string   "nome_fantasia"
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_abertura"
  end

  create_table "produtos", force: true do |t|
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
  end

  add_index "produtos", ["categoria_produto_id"], name: "index_produtos_on_categoria_produto_id", using: :btree
  add_index "produtos", ["estoque_id"], name: "index_produtos_on_estoque_id", using: :btree
  add_index "produtos", ["fornecedor_id"], name: "index_produtos_on_fornecedor_id", using: :btree
  add_index "produtos", ["marca_id"], name: "index_produtos_on_marca_id", using: :btree
  add_index "produtos", ["unidade_id"], name: "index_produtos_on_unidade_id", using: :btree

  create_table "unidades", force: true do |t|
    t.string   "descricao"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
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
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "vendas", force: true do |t|
    t.integer  "forma_pagamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendas", ["forma_pagamento_id"], name: "index_vendas_on_forma_pagamento_id", using: :btree

end
