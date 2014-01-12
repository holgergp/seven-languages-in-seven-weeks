import scala.io.Source

trait Zensur {
	val badWordMapping = Map("Mist"->"Blub", "Verdammt" ->"Beep")
	
	val badWordMappingFromFile = readWordMapping()
	def zensiere(words: String)={

		(words /: badWordMappingFromFile) {(censoredContent, currentMapping) => 
			censoredContent.replaceAll(currentMapping._1,currentMapping._2)
		}
	}

	def readWordMapping() ={
		Source.fromFile("zensurConfig.cfg").getLines.foldLeft(Map[String,String]())(  {(mymap,stringLine) => 
				val stringSplitted = stringLine.split(",")
				println (stringSplitted(1))
				//mymap(stringSplitted(1)) = stringSplitted(2)
				mymap("1") = "1"
			})
	}
}

class Article (val content: String) extends Zensur {
	def getCensoredContent() = this.zensiere(content)
	
}

val article = new Article("Was ein Verdammter Mist")
println(article.getCensoredContent)