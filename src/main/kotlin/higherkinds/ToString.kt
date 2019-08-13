import arrow.higherkind

@higherkind
data class ToString<A>(val f: (A) -> String) : ToStringOf<A> {
  companion object {}
}