CREATE TYPE "Classes" AS ENUM ('Arcanista', 'Barbaro', 'Bardo', 'Bucaneiro', 'Cacador', 'Cavaleiro', 'Clerigo', 'Druida', 'Guerreiro', 'Inventor', 'Ladino', 'Lutador', 'Nobre', 'Paladino');

CREATE TYPE "Attributes" AS ENUM ('FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR');

CREATE TYPE "Ranges" AS ENUM ('Curto', 'Medio', 'Longo', 'Outro');

CREATE TYPE "DamageTypes" AS ENUM ('Perfuracao', 'Corte', 'Impacto', 'Outro');

CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "characters" (
    "user_id" TEXT NOT NULL,
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "class" "Classes" NOT NULL,
    "level" INTEGER NOT NULL,
    "strength" INTEGER NOT NULL,
    "dexterity" INTEGER NOT NULL,
    "constitution" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "wisdom" INTEGER NOT NULL,
    "charisma" INTEGER NOT NULL,

    CONSTRAINT "characters_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "defenses" (
    "character_id" INTEGER NOT NULL,
    "slot1_name" TEXT NOT NULL,
    "slot1_defense" INTEGER NOT NULL,
    "slot1_penalty" INTEGER NOT NULL,
    "slot2_name" TEXT NOT NULL,
    "slot2_defense" INTEGER NOT NULL,
    "slot2_penalty" INTEGER NOT NULL,
    "attribute" "Attributes" NOT NULL,
    "use_atribute" BOOLEAN NOT NULL,
    "others" INTEGER NOT NULL
);

CREATE TABLE "attacks" (
    "character_id" INTEGER NOT NULL,
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "attack_bonus" INTEGER NOT NULL,
    "damage" TEXT NOT NULL,
    "extra_damage" INTEGER NOT NULL,
    "damage_type" "DamageTypes" NOT NULL,
    "damage_attribute" "Attributes" NOT NULL,
    "extra_dices" INTEGER NOT NULL,
    "critical_type" TEXT NOT NULL,
    "critical_value" INTEGER NOT NULL,
    "critical_multiplier" INTEGER NOT NULL,
    "range" "Ranges" NOT NULL,

    CONSTRAINT "attacks_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "character_skills" (
    "character_id" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,
    "trained" BOOLEAN NOT NULL,
    "attribute" "Attributes" NOT NULL,
    "others" INTEGER NOT NULL
);

CREATE TABLE "skills" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "trained" BOOLEAN NOT NULL,
    "penalty" BOOLEAN NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "users_id_email_key" ON "users"("id", "email");

CREATE UNIQUE INDEX "defenses_character_id_key" ON "defenses"("character_id");

CREATE UNIQUE INDEX "character_skills_skill_id_key" ON "character_skills"("skill_id");

ALTER TABLE "characters" ADD CONSTRAINT "characters_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "defenses" ADD CONSTRAINT "defenses_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "attacks" ADD CONSTRAINT "attacks_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;