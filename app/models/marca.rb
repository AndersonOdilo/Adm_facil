class Marca < ActiveRecord::Base
    has_many :produtos, dependent: :restrict_with_error
end
