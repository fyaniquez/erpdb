class Producto < ApplicationRecord
  belongs_to :marca
  belongs_to :usuario
  belongs_to :categoria
  def precio
    super.to_f / DECIMALES
  end
  def precio=(value)
    super(value.to_f * DECIMALES)
  end
end
