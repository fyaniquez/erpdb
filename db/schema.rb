# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_23_232238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almacenes", force: :cascade do |t|
    t.string "nombre"
    t.string "estado", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "capitulos", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nombre"], name: "index_capitulos_on_nombre", unique: true
  end

  create_table "categorias", force: :cascade do |t|
    t.bigint "capitulo_id", null: false
    t.string "nombre", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["capitulo_id"], name: "index_categorias_on_capitulo_id"
  end

  create_table "detalles", force: :cascade do |t|
    t.string "type"
    t.bigint "transaccion_id", null: false
    t.bigint "producto_id", null: false
    t.integer "precio"
    t.integer "cantidad"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["producto_id"], name: "index_detalles_on_producto_id"
    t.index ["transaccion_id"], name: "index_detalles_on_transaccion_id"
  end

  create_table "empresa", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.bigint "pais_id", null: false
    t.string "nit", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pais_id"], name: "index_empresa_on_pais_id"
    t.index ["persona_id"], name: "index_empresa_on_persona_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.bigint "pais_id", null: false
    t.string "nit", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pais_id"], name: "index_empresas_on_pais_id"
    t.index ["persona_id"], name: "index_empresas_on_persona_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.bigint "empresa_id", null: false
    t.string "estado", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_marcas_on_empresa_id"
    t.index ["nombre"], name: "index_marcas_on_nombre", unique: true
  end

  create_table "paises", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.string "iso2", limit: 2
    t.index ["iso2"], name: "index_paises_on_iso2", unique: true
    t.index ["nombre"], name: "index_paises_on_nombre", unique: true
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.string "documento", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["documento"], name: "index_personas_on_documento", unique: true
    t.index ["nombre"], name: "index_personas_on_nombre", unique: true
  end

  create_table "precios", force: :cascade do |t|
    t.bigint "producto_id", null: false
    t.bigint "almacen_id", null: false
    t.string "por", limit: 30
    t.integer "prc"
    t.integer "cantidad"
    t.string "barras", limit: 20
    t.integer "orden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["almacen_id"], name: "index_precios_on_almacen_id"
    t.index ["producto_id"], name: "index_precios_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "marca_id", null: false
    t.bigint "categoria_id", null: false
    t.string "nombre", limit: 30
    t.string "unidad", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["marca_id"], name: "index_productos_on_marca_id"
    t.index ["nombre"], name: "index_productos_on_nombre"
    t.index ["usuario_id"], name: "index_productos_on_usuario_id"
  end

  create_table "transacciones", force: :cascade do |t|
    t.string "type"
    t.bigint "usuario_id", null: false
    t.bigint "almacen_id", null: false
    t.datetime "fecha"
    t.integer "objeto"
    t.string "glosa", limit: 255
    t.string "estado", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["almacen_id"], name: "index_transacciones_on_almacen_id"
    t.index ["usuario_id"], name: "index_transacciones_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.string "identificacion"
    t.string "password_digest"
    t.string "externo", limit: 255
    t.string "estado", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_id"], name: "index_usuarios_on_persona_id"
  end

  add_foreign_key "categorias", "capitulos"
  add_foreign_key "detalles", "productos"
  add_foreign_key "detalles", "transacciones"
  add_foreign_key "empresa", "paises"
  add_foreign_key "empresa", "personas"
  add_foreign_key "empresas", "paises"
  add_foreign_key "empresas", "personas"
  add_foreign_key "marcas", "empresa"
  add_foreign_key "precios", "almacenes"
  add_foreign_key "precios", "productos"
  add_foreign_key "productos", "categorias"
  add_foreign_key "productos", "marcas"
  add_foreign_key "productos", "usuarios"
  add_foreign_key "transacciones", "almacenes"
  add_foreign_key "transacciones", "usuarios"
  add_foreign_key "usuarios", "personas"
end
