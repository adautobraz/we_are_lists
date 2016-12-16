class Livro < ActiveRecord::Base
    belongs_to :list
    validates :obra, :selo, :edicao, :autor, :disciplina, :presence => true
end