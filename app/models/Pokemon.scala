package models

import models.Type.Type
import play.api.libs.json._
/**
  * Created by theo on 8/19/16.
  */


case class Pokemon(
  id: Int,
  chinese_name: String,
  english_name: String,
  description: Option[String],
  type_1: Type,
  type_2: Option[Type],
  ability_1: Int,
  ability_2: Option[Int],
  ability_3: Option[Int],
  full_exp: Int,
  height: Double,
  weight: Double,
  male_rate: Double,
  catch_rate: Int,
  birth_period: Int,
  base_stat: JsValue,
  base_exp: Int,
  species_hp: Int,
  species_attack: Int,
  species_defense: Int,
  species_sa: Int,
  species_sd: Int,
  species_speed: Int,
  evolve_from: Option[Int],
  evolve_to: Option[Int],
  evolve_item: Option[Int],
  learnable_move: JsValue,
  useable_tm: JsValue,
  inherit_move: JsValue
)
