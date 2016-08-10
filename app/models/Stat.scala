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

object Stat extends Enumeration {
  type Stat = Value
  val HP = Value("HP")
  val ATTACK = Value("Attack")
  val DEFENSE = Value("Defense")
  val SA = Value("Special attack")
  val SD = Value("Special defense")
  val SPEED = Value("Speed")
}
