class Precio < ApplicationRecord
  belongs_to :producto
  belongs_to :almacen
  def precio
    super.to_f / DECIMALES
  end
  def precio=(value)
    super(value.to_f * DECIMALES)
  end
end
end
