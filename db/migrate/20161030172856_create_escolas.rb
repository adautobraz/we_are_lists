class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.bigint  :mec 
      t.string  :nome
      t.string  :cnpj
      t.string  :logradouro
      t.string  :endereco
      t.string  :numero
      t.string  :complemento
      t.string  :bairro
      t.bigint  :cep
      t.string  :municipio
      t.string  :uf
      t.string  :ddd
      t.string  :telefone1
      t.string  :telefone2
      t.string  :site
    end
  end
end
