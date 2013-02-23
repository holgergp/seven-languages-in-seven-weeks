/**
 * Created with IntelliJ IDEA.
 * User: flunky
 * Date: 17.02.13
 * Time: 14:11
 * To change this template use File | Settings | File Templates.
 */

class Compass{
  val directions = List ("north","east","south","west")
  var bearing=0

  print ("Initial bearing: ")
  println(direction)

  def direction() = directions(bearing)

  def inform(turnDirection: String){
    println("Turning "+ turnDirection + ". Now bearing " + direction)
  }

  def turnRight(){
    bearing =(bearing + 1) % directions.size
    inform("right")
  }

  def turnLeft(){
      bearing =(bearing + ( directions.size -1))%directions.size
      inform("left")
  }

}

val myCompass= new Compass
myCompass.turnRight
myCompass.turnRight

myCompass.turnLeft
myCompass.turnLeft
myCompass.turnLeft

