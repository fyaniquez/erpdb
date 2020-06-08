class Empresa < ApplicationRecord
  belongs_to :pais
  belongs_to :persona
end
