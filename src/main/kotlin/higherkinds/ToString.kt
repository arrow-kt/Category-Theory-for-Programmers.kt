import arrow.higherkind
import arrow.core.Option

val mis= Option(listOf(1, 2, 3))

@higherkind
data class ToString<A>(val f: (A) -> String) : ToStringOf<A> {
  companion object {}
}