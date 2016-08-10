name := """pokemon-diy"""
version := "0.0.1"
organization := "org.canistech"
scalaVersion := "2.11.7"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

libraryDependencies ++= Seq(
  "org.scalatestplus.play" %% "scalatestplus-play" % "1.5.1" % Test,
  "com.typesafe.play" %% "play-slick" % "2.0.0",
  "com.typesafe.play" %% "play-slick-evolutions" % "2.0.0",
  "com.github.tminglei" %% "slick-pg" % "0.14.3",
  "com.github.tminglei" %% "slick-pg_play-json" % "0.14.3",
  "com.github.tminglei" %% "slick-pg_date2" % "0.14.3"
)

resolvers += "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases"

fork in run := false
