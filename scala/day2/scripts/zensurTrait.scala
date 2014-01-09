trait Zensur {
	val badWordMapping=Map("Mist"->"Blub", "Verdammt" ->"Beep")
	
	def zensiere(words: String)={
		(words /: badWordMapping) {(censoredContent, currentMapping) => 
			censoredContent.replaceAll(currentMapping._1,currentMapping._2)
		}
	}
}

class Article (val content: String) extends Zensur {
	def getCensoredContent() = this.zensiere(content)
	
}

val article = new Article("Was ein Verdammter Mist")
println(article.getCensoredContent)