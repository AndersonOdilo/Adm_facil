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

ActiveRecord::Schema.define(version: 20150223191809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: true do |t|
    t.string   "nome"
    t.integer  "cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bairros", ["cidade_id"], name: "index_bairros_on_cidade_id", using: :btree

  create_table "cidades", force: true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "emails", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enderecos", force: true do |t|
    t.string   "numero"
    t.string   "complemento"
    t.integer  "rua_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enderecos", ["rua_id"], name: "index_enderecos_on_rua_id", using: :btree

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
  end

  create_table "logradouros", force: true do |t|
    t.string   "nome"
    t.string   "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "CD_TIPO_LOGRADOUROS"
    t.integer  "bairro_id"
  end

  add_index "logradouros", ["bairro_id"], name: "index_logradouros_on_bairro_id", using: :btree

  create_table "paises", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
