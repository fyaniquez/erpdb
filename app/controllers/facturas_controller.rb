class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  #GET /facturas/new
  def new
    @factura = Venta.create(estado: "creando", usuario_id: current_user.id, almacen_id: 3, fecha: Date.today)
    @vendido = Vendido.new(transaccion: @factura)
    @productos = productos_lista
  end
  # GET /facturas/1/edit
  def edit
    @productos = Producto.all
  end
  # PATCH/PUT /ventas/1
  # PATCH/PUT /ventas/1.json
  def update
    respond_to do |format|
      @vendido.create(venta_params[:producto_id])
      if @venta.update(venta_params[:objeto])
        format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
      if @venta.update(venta_params[:objeto])
        format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def productos_lista
    Producto.order(:nombre).collect {|p| [p.nombre, {precio: p.precio}, p.id]}
  end  
  def factura_params
    params.require(:venta).permit(:objeto, vendido: [:producto_id, :precio, :cantidad, :total])
  end
end
