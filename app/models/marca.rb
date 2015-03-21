class Marca < ActiveRecord::Base
    has_many :produtos, dependent: :restrict_with_error
    validates_uniqueness_of :nome, :case_sensitive => false
end
