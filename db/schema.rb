# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161207011048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "texto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "comentario_id"
    t.integer  "usuario_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer  "usuario_id"
    t.text     "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "favor_id"
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "monto"
    t.integer  "usuario_id"
    t.string   "n_tarjeta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mes"
    t.string   "ano"
    t.string   "cvv"
    t.string   "titular"
  end

  create_table "favors", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "foto"
    t.string   "ubicacion"
    t.integer  "usuario_id"
    t.boolean  "resuelta"
  end

  create_table "logros", force: :cascade do |t|
    t.string   "etiqueta"
    t.integer  "puntosMin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postulacions", force: :cascade do |t|
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "favor_id"
    t.text     "descripcion"
    t.boolean  "elegido"
  end

  create_table "postulantes", force: :cascade do |t|
    t.integer  "id_user"
    t.integer  "id_gauchada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reportes", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "cantidad"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "tipodeusuarios"
    t.date     "fechainicial"
    t.date     "fechafinal"
  end

  create_table "usuarioreportes", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reporte_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "nombre"
    t.string   "apellido"
    t.boolean  "admin",                  default: false
    t.integer  "puntos",                 default: 1
    t.datetime "fecha_de_nacimiento"
    t.boolean  "es_mujer"
    t.string   "foto"
    t.string   "ubicacion"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
