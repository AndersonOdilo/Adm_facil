class Pais < ActiveRecord::Base
    has_many :estados, dependent: :restrict_with_error
end
