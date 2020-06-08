class Usuario < ApplicationRecord
  belongs_to :persona
  has_secure_password
end
