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

import java.time.{LocalDate, LocalTime}

import play.api.data.FormError
import play.api.data.format.Formats
import play.api.data.format.Formatter

object MyFormat {
  private def parsing[T](parse: String => T, errorMessage: String, errorArguments: Seq[Any])
                        (key: String, data: Map[String, String]): Either[Seq[FormError], T] = {
    Formats.stringFormat.bind(key, data).right.flatMap { s =>
      scala.util.control.Exception.allCatch[T]
        .either(parse(s))
        .left.map(e => Seq(FormError(key, errorMessage, errorArguments)))
    }
  }

  def j8DateFormat: Formatter[LocalDate] = new Formatter[LocalDate] {
    override val format = Some(("format.datetime", Nil))

    def bind(key: String, data: Map[String, String]) = parsing(LocalDate.parse, "error.datetime", Nil)(key, data)

    def unbind(key: String, value: LocalDate) = Map(key -> value.toString)
  }

  def j8TimeFormat: Formatter[LocalTime] = new Formatter[LocalTime] {
    override val format = Some(("format.localtime", Nil))

    def bind(key: String, data: Map[String, String]) = parsing(LocalTime.parse, "error.localtime", Nil)(key, data)

    def unbind(key: String, value: LocalTime) = Map(key -> value.toString)
  }

  def enumFormat[A <: Enumeration](enum: A): Formatter[A#Value] = new Formatter[A#Value] {
    override val format = Some(("format.enum", Nil))

    override def bind(key: String, data: Map[String, String]) = {
      Formats.stringFormat.bind(key, data).right.flatMap { s =>
        scala.util.control.Exception.allCatch[A#Value].either(enum.withName(s)).left.map { _ =>
          Seq(FormError(key, "error.enum", Nil))
        }
      }
    }

    override def unbind(key: String, value: A#Value): Map[String, String] = Map(key -> value.toString)
  }

  def enum[A <: Enumeration](value: A) = new play.api.data.FieldMapping[A#Value]()(enumFormat(value))
}
