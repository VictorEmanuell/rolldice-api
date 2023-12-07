# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_07_192717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "Attributes", ["FOR", "DES", "CON", "INT", "SAB", "CAR"]
  create_enum "Classes", ["Arcanista", "Barbaro", "Bardo", "Bucaneiro", "Cacador", "Cavaleiro", "Clerigo", "Druida", "Guerreiro", "Inventor", "Ladino", "Lutador", "Nobre", "Paladino"]
  create_enum "DamageTypes", ["Perfuracao", "Corte", "Impacto", "Outro"]
  create_enum "Ranges", ["Curto", "Medio", "Longo", "Outro"]

  create_table "attacks", id: :serial, force: :cascade do |t|
    t.integer "character_id", null: false
    t.text "name", null: false
    t.integer "attack_bonus", null: false
    t.text "damage", null: false
    t.integer "extra_damage", null: false
    t.enum "damage_type", null: false, enum_type: ""DamageTypes""
    t.string "damage_attribute", null: false
    t.string "extra_dices", default: "0", null: false
    t.text "critical_type", null: false
    t.integer "critical_value", null: false
    t.integer "critical_multiplier", null: false
    t.enum "range", null: false, enum_type: ""Ranges""
    t.integer "use_skill", default: 0
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "skill_id", null: false
    t.boolean "trained", null: false
    t.enum "character_attribute", null: false, enum_type: ""Attributes""
    t.integer "others", null: false
    t.index ["skill_id"], name: "character_skills_skill_id_key", unique: true
  end

  create_table "characters", id: :serial, force: :cascade do |t|
    t.text "user_id", null: false
    t.text "name", null: false
    t.enum "character_class", null: false, enum_type: ""Classes""
    t.integer "level", null: false
    t.integer "strength", null: false
    t.integer "dexterity", null: false
    t.integer "constitution", null: false
    t.integer "intelligence", null: false
    t.integer "wisdom", null: false
    t.integer "charisma", null: false
  end

  create_table "defenses", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.text "slot1_name", default: ""
    t.integer "slot1_defense", default: 0
    t.integer "slot1_penalty", default: 0
    t.text "slot2_name", default: ""
    t.integer "slot2_defense", default: 0
    t.integer "slot2_penalty", default: 0
    t.enum "defense_attribute", default: "DES", null: false, enum_type: ""Attributes""
    t.boolean "use_attribute", default: false
    t.integer "others", default: 0
    t.index ["character_id"], name: "defenses_character_id_key", unique: true
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.boolean "training", null: false
    t.boolean "penalty", null: false
  end

  create_table "users", id: :text, force: :cascade do |t|
    t.text "name", null: false
    t.text "email", null: false
    t.index ["id", "email"], name: "users_id_email_key", unique: true
  end

  add_foreign_key "attacks", "characters", name: "attacks_character_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "character_skills", "characters", name: "character_skills_character_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "character_skills", "skills", name: "character_skills_skill_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "characters", "users", name: "characters_user_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "defenses", "characters", name: "defenses_character_id_fkey", on_update: :cascade, on_delete: :restrict
end
