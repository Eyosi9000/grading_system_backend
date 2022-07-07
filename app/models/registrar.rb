class Registrar < ApplicationRecord
    validates :first_name, :middle_name, :last_name, :email, presence: true
end
