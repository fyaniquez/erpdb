class Transaccion < ApplicationRecord
  has_many :detalles, dependent: :destroy
  belongs_to :usuario
  belongs_to :almacen
end
