package arrow.ctfp

import arrow.core.compose
import arrow.core.identity

val f: (Int) -> Int = { it }
val identity: (Int) -> Int = ::identity

typealias B = Int

object Test {
  @JvmStatic
  fun main(args: Array<String>) {
    println(f compose identity == f)
    println(identity compose f == f)
  }
}



//identity[B] _ compose f == f