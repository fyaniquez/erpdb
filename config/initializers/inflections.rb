# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections(:en) do |inflect|
   inflect.irregular 'pais', 'paises'
   inflect.irregular 'usuario', 'usuarios'
   inflect.irregular 'cliente', 'clientes'
   inflect.irregular 'empresa', 'empresas'
   inflect.irregular 'distribuidor', 'distribuidores'
   inflect.irregular 'grupo', 'grupos'
   inflect.irregular 'miembro', 'miembros'
   inflect.irregular 'empleado', 'miembros'
   inflect.irregular 'vendedor', 'vendedores'
   inflect.irregular 'transportista', 'transportistas'
   inflect.irregular 'supervisor', 'supervisores'
   inflect.irregular 'almacen', 'almacenes'
   inflect.irregular 'caja', 'cajas'
   inflect.irregular 'existencia', 'existencias'
   inflect.irregular 'contacto', 'contactos'
   inflect.irregular 'nota', 'notas'
   inflect.irregular 'marca', 'marcas'
   inflect.irregular 'capitulo', 'capitulos'
   inflect.irregular 'categoria', 'categorias'
   inflect.irregular 'producto', 'productos'
   inflect.irregular 'precio', 'precios'
   inflect.irregular 'distribuido', 'distribuidos'
   inflect.irregular 'transaccion', 'transacciones'
   inflect.irregular 'venta', 'ventas'
   inflect.irregular 'compra', 'compras'
   inflect.irregular 'ingreso', 'ingresos'
   inflect.irregular 'salida', 'salidas'
   inflect.irregular 'preventa', 'preventas'
   inflect.irregular 'detalle', 'detalles'
   inflect.irregular 'inventariado', 'inventariados'
   inflect.irregular 'vendido', 'vendidos'
   inflect.irregular 'comprado', 'comprados'
   inflect.irregular 'ingresado', 'ingresados'
   inflect.irregular 'salido', 'salidos'
   inflect.irregular 'prevendido', 'prevendidos'
   inflect.irregular 'dinero', 'dineros'
   inflect.irregular 'deposito', 'depositos'
   inflect.irregular 'retiro', 'retiros'
   inflect.irregular 'faltante', 'faltantes'
   inflect.irregular 'sobrante', 'sobrantes'
end
