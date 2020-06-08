class Producto < ApplicationRecord
  belongs_to :marca
  belongs_to :usuario
  belongs_to :categoria
end
