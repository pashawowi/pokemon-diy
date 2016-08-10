# --- !Ups
CREATE TYPE gender AS ENUM ('Male', 'Female', 'Unknown');
CREATE TYPE "type" AS ENUM ('Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting', 'Fire', 'Flying', 'Ghost', 'Grass',
  'Ground', 'Ice', 'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water', 'Unknown');
CREATE TYPE egg_group AS ENUM ('Amorphous', 'Bug', 'Ditto', 'Dragon', 'Fairy', 'Field', 'Flying', 'Grass', 'Human like',
  'Mineral', 'Monster', 'Water I', 'Water II', 'Water III', 'Undiscovered', 'Gender unknown');
CREATE TYPE stat AS ENUM ('HP', 'Attack', 'Defense', 'Special attack', 'Special defense', 'Speed');
CREATE TYPE move_category AS ENUM ('Physical', 'Special', 'Status');

CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,
  chinese_name TEXT NOT NULL,
  english_name TEXT NOT NULL,
  description TEXT NOT NULL,
  type_1 "type" NOT NULL,
  type_2 "type",
  ability INTEGER REFERENCES ability (id) NOT NULL,
  special_ability INTEGER REFERENCES ability (id) NOT NULL,
  full_exp INTEGER NOT NULL,
  height REAL NOT NULL, -- meter
  weight REAL NOT NULL, -- kilo gramme
  male_rate REAL NOT NULL, -- percentage
  catch_rate INTEGER NOT NULL, -- [0, 255]
  birth_period INTEGER NOT NULL,
  base_stat JSONB NOT NULL, -- in form {stat: number}
  base_exp INTEGER NOT NULL,
  species_hp INTEGER NOT NULL,
  species_attack INTEGER NOT NULL,
  species_defense INTEGER NOT NULL,
  species_sa INTEGER NOT NULL,
  species_sd INTEGER NOT NULL,
  species_speed INTEGER NOT NULL,
  evolve_from INTEGER REFERENCES pokemon (id),
  evolve_to INTEGER REFERENCES pokemon (id),
  evolve_item INTEGER REFERENCES item (id),
  learnable_move JSONB, -- {level: move_id}
  useable_tm JSONB, -- An array of id
  inherit_move JSONB -- An array of id
);

CREATE TABLE ability (
  id INTEGER PRIMARY KEY,
  description TEXT NOT NULL
);

CREATE TABLE item (
  id SERIAL PRIMARY KEY, -- NOTE: The ID is not important in the games.
  description TEXT NOT NULL
);

CREATE TABLE move (
  id INTEGER PRIMARY KEY,
  chinese_name TEXT NOT NULL,
  english_name TEXT NOT NULL,
  description TEXT NOT NULL,
  "type" "type" NOT NULL,
  category move_category NOT NULL,
  power INT NOT NULL,
  accuracy INT NOT NULL, -- percentage
  pp INT NOT NULL
);

# --- !Downs
DROP TYPE IF EXISTS gender CASCADE;
DROP TYPE IF EXISTS "type" CASCADE;
DROP TYPE IF EXISTS egg_group CASCADE;
DROP TYPE IF EXISTS stat CASCADE;
DROP TYPE IF EXISTS move_category CASCADE;
DROP TABLE IF EXISTS pokemon CASCADE;
DROP TABLE IF EXISTS ability CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS move CASCADE;