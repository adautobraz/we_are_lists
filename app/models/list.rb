class List < ActiveRecord::Base
    belongs_to :escola
    has_many :livros
    accepts_nested_attributes_for :livros
    validates :escola_id, presence:true
end