class Cargo < ActiveRecord::Base
    validates_uniqueness_of :descricao, case_sensitive: false, presence: { message: "Este cargo ja existe" }
end
