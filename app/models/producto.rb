class Producto < ApplicationRecord
  belongs_to :marca
  belongs_to :usuario
  belongs_to :categoria
  def precio
    super / DECIMALES
  end
  def precio=(value)
    super(value * DECIMALES)
  end
end
