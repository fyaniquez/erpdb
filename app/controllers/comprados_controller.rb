class CompradosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comprado, only: [:show, :edit, :update, :destroy]

  # GET /comprados
  # GET /comprados.json
  def index
    @comprados = Comprado.all
  end

  # GET /comprados/1
  # GET /comprados/1.json
  def show
  end

  # GET /comprados/new
  def new
    @comprado = Comprado.new
    @productos = productos_lista
  end

  # GET /comprados/1/edit
  def edit
    @productos = productos_lista
  end

  # POST /comprados
  # POST /comprados.json
  def create
    @comprado = Comprado.new(comprado_params)
    respond_to do |format|
      if @comprado.save
        format.html { redirect_to @comprado, notice: 'Comprado was successfully created.' }
        format.json { render :show, status: :created, location: @comprado }
      else
        format.html { render :new }
        format.json { render json: @comprado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comprados/1
  # PATCH/PUT /comprados/1.json
  def update
    respond_to do |format|
      if @comprado.update(comprado_params)
        format.html { redirect_to @comprado, notice: 'Comprado was successfully updated.' }
        format.json { render :show, status: :ok, location: @comprado }
      else
        format.html { render :edit }
        format.json { render json: @comprado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comprados/1
  # DELETE /comprados/1.json
  def destroy
    @comprado.destroy
    respond_to do |format|
      format.html { redirect_to comprados_url, notice: 'Comprado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comprado
      @comprado = Comprado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comprado_params
      params.permit!
      params.fetch(:comprado, {})
    end

    def unidades_lista
      [["unidad", "u"], ["paquete", "paq."],["litro", "Lt"], ["Botella", "bot"], ["Pieza", "pza"],["sachet", "sach"],["Hojas", "h"], ["Bolivianos", "Bs."]]
    end

    def productos_lista
      Producto.order(:nombre).collect {|p| [p.nombre, {precio: p.precio}, p.id]}
    end
end
