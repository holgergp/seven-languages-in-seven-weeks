object Tictactoe extends App {
  override def main(args: Array[String]) {

  	var board= new Board
  	val player1 = new Player("X");
  	val player2 = new Player("O");

  	board.printBoard

  	 while(!board.isFinished){
  		var succesful1=false
  		while(!succesful1) {
  			val (xPos,yPos)=player1.makeAMove()
	  		succesful1= board.putXOn(xPos.toInt,yPos.toInt)	;
  		}
  		board.printBoard

  		if(!board.isFinished) {
  			var succesful2=false
  			while(!succesful2) {
  				val (xPos,yPos)=player2.makeAMove()
	  			succesful2= board.putOOn(xPos.toInt,yPos.toInt);
  			}
  			board.printBoard
  		}		
  	}
  	if (board.isFinishedFor("X")) {
  		println ("X hat gewonnen!")
  	}

  	else if (board.isFinishedFor("O")) {
  		println ("O hat gewonnen!")
  	}

  	else println ("Unentschieden!")
    	
  }

}

class Player(val playerCharacter:String) {



	def makeAMove(): (String,String) ={
	  		println("Spieler " +playerCharacter+": ")
	  		println("XPos: ")
	  		var xPos=readLine();
	  		println("YPos: ")
	  		var yPos=readLine();
	  		return (xPos,yPos)
	}


}

class Board {
	
	var boardArray = Array(Array("", "", ""), Array("", "", ""),Array("","",""))

	def putXOn(x: Integer,y: Integer):Boolean={
		return putOn("X",x,y)	
	}

	def putOOn(x: Integer,y: Integer):Boolean={
		return putOn("Y",x,y)	
	}

	def putOn(element:String,x:Integer, y:Integer):Boolean= {

		
	
		if(boardArray(x)(y)== ""){
			boardArray(x)(y)=element
			return true;
		}
		else {
			println("Geht nicht!")
			return false
		}

	} 

	def printBoard(){
		println(boardArray.deep.mkString("\n"))
	}

	def isFinishedFor(character:String):Boolean={


		return checkRows(character) || checkColumns(character)||checkFirstDiagonal(character)||checkSecondDiagonal(character)
		

	}

	def isFinished():Boolean={
		return isFinishedFor("X") || isFinishedFor("O")||isFull()
	}

	def checkRows(character:String):Boolean= {

		for(i<-0 until 2){
			if(boardArray(i)(0)==character&&boardArray(i)(0)==boardArray(i)(1)&&boardArray(i)(1)==boardArray(i)(2)){
				return true;
			}
		}
		return false;
	}

	def checkColumns(character:String):Boolean= {
		for(i<-0 until 2){
			if(boardArray(0)(i)==character&&boardArray(0)(i)==boardArray(1)(i)&&boardArray(1)(i)==boardArray(2)(i)){
				return true;
			}
		}
		return false;
		
	}

	def checkFirstDiagonal(character:String):Boolean={
		
			if(boardArray(0)(2)==character&&boardArray(0)(2)==boardArray(1)(1)&&boardArray(1)(1)==boardArray(2)(0)){
				return true;
			}
		
		return false;


	}


	def checkSecondDiagonal(character:String):Boolean={
		if(boardArray(0)(0)==character&&boardArray(0)(0)==boardArray(1)(1)&&boardArray(1)(1)==boardArray(2)(2)){
				return true;
			}
		
		return false;
	}

	def isFull():Boolean={
		for(i<-0 until 2){
			for(j<-0 until 2){
				if(boardArray(i)(j)==""){
					return false;
				}

			}
		}
		return true;

	}
}


