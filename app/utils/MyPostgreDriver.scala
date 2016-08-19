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

package utils

import com.github.tminglei.slickpg._
import play.api.libs.json._

import models.{EggGroup, Gender, MoveCategory, Stat, Type}

trait MyPostgreDriver extends ExPostgresDriver
  with PgEnumSupport
  with PgArraySupport
  with PgDate2Support
  with PgRangeSupport
  with PgPlayJsonSupport
  with PgSearchSupport {

  def pgjson = "jsonb"

  override val api = MyAPI

  object MyAPI extends API with ArrayImplicits with DateTimeImplicits with JsonImplicits with RangeImplicits
    with SearchImplicits with SearchAssistants {
    implicit val strListTypeMapper = new SimpleArrayJdbcType[String]("text").to(_.toList)
    implicit val playJsonArrayTypeMapper = new AdvancedArrayJdbcType[JsValue](pgjson,
      (s) => utils.SimpleArrayUtils.fromString[JsValue](Json.parse)(s).orNull,
      (v) => utils.SimpleArrayUtils.mkString[JsValue](_.toString())(v)).to(_.toList)
    implicit val eggGroupTypeMapper = createEnumJdbcType("EggGroup", EggGroup)
    implicit val eggGroupListTypeMapper = createEnumListJdbcType("EggGroup", EggGroup)
    implicit val genderTypeMapper = createEnumJdbcType("Gender", Gender)
    implicit val genderListTypeMapper = createEnumListJdbcType("Gender", Gender)
    implicit val moveCategoryTypeMapper = createEnumJdbcType("MoveCategory", MoveCategory)
    implicit val moveCategoryListTypeMapper = createEnumListJdbcType("MoveCategory", MoveCategory)
    implicit val statTypeMapper = createEnumJdbcType("Stat", Stat)
    implicit val statListTypeMapper = createEnumListJdbcType("Stat", Stat)
    implicit val typeTypeMapper = createEnumJdbcType("Type", Type)
    implicit val typeListTypeMapper = createEnumListJdbcType("Type", Type)
  }
}

object MyPostgreDriver extends MyPostgreDriver
