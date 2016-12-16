class Livro < ActiveRecord::Base
    belongs_to :list
    validates :obra, :selo, :edicao, :autor, :volume_serie, :disciplina, :presence => true
end