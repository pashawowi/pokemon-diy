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

package dao

import javax.inject.{Inject, Singleton}

import play.api.db.slick.{DatabaseConfigProvider, HasDatabaseConfigProvider}
import utils.MyPostgreDriver
import utils.MyPostgreDriver.api._
import models.Move
import models.Type.Type
import models.MoveCategory.MoveCategory

import scala.concurrent.{ExecutionContext, Future}

@Singleton
class MoveDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)
                        (implicit ec: ExecutionContext)
  extends HasDatabaseConfigProvider[MyPostgreDriver] {

  class MoveTable(tag: Tag) extends Table[Move](tag, "move") {
    def id = column[Int]("id", O.PrimaryKey)
    def chineseName = column[String]("chinese_name")
    def englishName = column[String]("english_name")
    def description = column[String]("description")
    def typ = column[Type]("type")
    def category = column[MoveCategory]("category")
    def power = column[Int]("power")
    def accuracy = column[Int]("accuracy")
    def pp = column[Int]("pp")

    def * = (id, chineseName, englishName, description, typ, category, power, accuracy, pp) <> (Move.tupled, Move.unapply)
  }

  object move extends TableQuery(new MoveTable(_)) {
    def getById(id: Int): Future[Option[Move]] =
      db.run(move.filter(_.id === id).result.headOption)
  }
}
