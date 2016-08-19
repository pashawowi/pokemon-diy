package controllers

import javax.inject._
import play.api.mvc._
import dao.MoveDAO

import scala.concurrent.ExecutionContext

@Singleton
class Application @Inject()(moveDAO: MoveDAO)
                           (implicit ec: ExecutionContext) extends Controller {

  def index = Action {
    Ok(views.html.index())
  }

  def move(id: Int) = Action.async {
    val move = for {
      m <- moveDAO.move.getById(id)
    } yield m
    move.map {
      case Some(u) => Ok(views.html.index())
      case None => NotFound
    }
  }

}
