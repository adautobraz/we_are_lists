class Escola < ActiveRecord::Base
    has_many :lists
    validates :nome, :mec, :endereco, :bairro, :municipio, :uf, :telefone1, :presence => true
end