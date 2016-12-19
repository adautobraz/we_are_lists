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

ActiveRecord::Schema.define(version: 20161219113737) do

  create_table "escolas", force: :cascade do |t|
    t.integer "mec",       limit: 8
    t.string  "nome"
    t.string  "cnpj"
    t.string  "endereco"
    t.string  "bairro"
    t.integer "cep",       limit: 8
    t.string  "municipio"
    t.string  "uf"
    t.string  "telefone1"
    t.string  "telefone2"
    t.string  "site"
  end

  create_table "lists", force: :cascade do |t|
    t.string  "segmento"
    t.integer "escola_id"
    t.string  "serie"
    t.string  "observacoes"
  end

  create_table "livros", force: :cascade do |t|
    t.integer "isbn",         limit: 8
    t.string  "selo"
    t.string  "edicao"
    t.string  "volume_serie"
    t.string  "disciplina"
    t.string  "segmento"
    t.string  "colecao"
    t.string  "obra"
    t.string  "autor"
    t.integer "list_id"
    t.string  "categoria"
  end

end
