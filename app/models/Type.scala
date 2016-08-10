/*
 * Copyright (c) 2016 Canis Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package models

object Type extends Enumeration {
  type Type = Value
  val BUG = Value("Bug")
  val DARK = Value("Dark")
  val DRAGON = Value("Dragon")
  val ELECTRIC = Value("Electric")
  val FAIRY = Value("Fairy")
  val FIGHTING = Value("Fighting")
  val FIRE = Value("Fire")
  val FLYING = Value("Flying")
  val GHOST = Value("Ghost")
  val GRASS = Value("Grass")
  val GROUND = Value("Ground")
  val ICE = Value("Ice")
  val NORMAL = Value("Normal")
  val POISON = Value("Poison")
  val PSYCHIC = Value("Psychic")
  val ROCK = Value("Rock")
  val STEEL = Value("Steel")
  val WATER = Value("Water")
  val UNKNOWN = Value("Unknown")
}
