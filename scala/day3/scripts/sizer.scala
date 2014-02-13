import scala.io._
import scala.actors._
import Actor._

// START:loader
object PageLoader {
 def getPageSize(url : String) = {
 	println (url)
 	Source.fromURL(url)(io.Codec("UTF-8")).mkString.length
 }

 def getLinksCount(url : String) = {
  println (url)
  def linksCount=0
  def sourceHTML=Source.fromURL(url)(io.Codec("UTF-8")).mkString
  "(?i)<a[^>]+?href".r.findAllIn( sourceHTML ).size
  
 }

  def getLinksCountFollowing(url : String) = {
  println (url)
  def sourceHTML=Source.fromURL(url)(io.Codec("UTF-8")).mkString
  "(?i)<a[^>]+?href".r.findAllIn( sourceHTML ).size
  
 }
}
// END:loader

val urls = List("http://www.heise.de/", 
               "http://www.ajaxian.com/",
               "http://www.metal.de/",
               "http://www.sport1.de/" )

// START:time
def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
 for(url <- urls) {
   println("Size for " + url + ": " + PageLoader.getPageSize(url))
 }
}
// END:sequential

// START:concurrent

def getPageSizeConcurrently() = {

val caller = self
 for(url <- urls) {
   actor { caller ! ("size",url, PageLoader.getPageSize(url)) }
   actor { caller ! ("links",url, PageLoader.getLinksCount(url)) }
 }


 for(i <- 1 to urls.size*2) {
   receive {
     case ("size",url, size) =>
       println("Size for " + url + ": " + size)        
      case ("links",url, count) =>
       println("Links for " + url + ": " + count)         
   }
 }
}
// END:concurrent

// START:concurrent
def getPageSizeConcurrentlyWithOneActor() = {
 val caller = self
actor {
 for(url <- urls) {
   caller ! (url, PageLoader.getPageSize(url)) 
   }
}
 for(i <- 1 to urls.size) {
   receive {
     case (url, size) =>
       println("Size for " + url + ": " + size) 
    
   }
 }
}



// START:concurrent
def getLinksCountConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor { caller ! (url, PageLoader.getLinksCount(url)) }
 }

 for(i <- 1 to urls.size ) {
   receive {
     case(url,count) =>
        println("Links for " + url + ": " + count)    
   }
 }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }

println("Concurrent run with one actor")
timeMethod { getPageSizeConcurrentlyWithOneActor }

//println("Get Links Count")
//timeMethod { getLinksCountConcurrently }
// END:script