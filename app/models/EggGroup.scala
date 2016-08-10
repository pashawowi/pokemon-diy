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

object EggGroup extends Enumeration {
  type EggGroup = Value
  val AMORPHOUS = Value("Amorphous")
  val BUG = Value("Bug")
  val DITTO = Value("Ditto")
  val DRAGON = Value("Dragon")
  val FAIRY = Value("Fairy")
  val FIELD = Value("Field")
  val FLYING = Value("Flying")
  val GRASS = Value("Grass")
  val HUMAN_LIKE = Value("Human like")
  val MINERAL = Value("Mineral")
  val MONSTER = Value("Monster")
  val WATER_I = Value("Water I")
  val WATER_II = Value("Water II")
  val WATER_III = Value("Water III")
  val UNDISCOVERED = Value("Undiscovered")
  val GENDER_UNKNOWN = Value("Gender unknown")
}
