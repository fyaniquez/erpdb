class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show, :edit, :update, :destroy]
  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Vendido.all
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show 
  end

  # GET /facturas/new
  def new
    factura_general
  end

  # GET /facturas/1/edit
  def edit
    #@factura = Venta.new(estado: "creando", usuario_id: current_user.id, almacen_id: 3, fecha: Date.today)
    #@vendido = Vendido.new(transaccion_id: @factura.id)
    @items = @factura.detalles
    @vendido = Vendido.new(transaccion_id: @factura.id)
    @productos = productos_lista
  end
  # POST /facturas
  def create
    @factura = Venta.new(objeto: 1, glosa: "glosa de prueba", estado: "creando", usuario_id: current_user.id, almacen_id: 3, fecha: Date.today)
    respond_to do |format|
      if @factura.save
        @vendido = Vendido.new(transaccion_id: @factura.id, producto_id: factura_params["producto_id"], precio: factura_params["precio"], cantidad: factura_params["cantidad"], total: factura_params["total"])
        if @vendido.save
          format.html { redirect_to edit_factura_path(@factura), notice: "todo ok" }
          format.json { render :show, status: :created, location: @factura }
        else
          format.html { render :new }
          format.json { render json: @vendido.errors, status: :unprocessable_entity }  
        end
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  def update    
    respond_to do |format|
      if @factura.update()
        format.html { redirect_to edit_factura_path(@factura), notice: "todo ok" }
        format.json { render :show, status: :created, location: @factura }
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_factura
      @factura = Venta.find(params[:id])
    end

    def productos_lista
      Producto.order(:nombre).collect {|p| [p.nombre, {precio: p.precio}, p.id]}
    end  

    def factura_params
      params.require(:venta).permit(:objeto, :producto_id, :precio, :cantidad, :total)
    end

    def factura_general
      @factura = Venta.new(estado: "creando", usuario_id: current_user.id, almacen_id: 3, fecha: Date.today)
      #@vendido = Vendido.new(transaccion_id: @factura.id)
      @vendido = @factura.detalles.new
      @productos = productos_lista
    end
end
