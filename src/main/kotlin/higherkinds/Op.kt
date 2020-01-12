import arrow.higherkind

@higherkind
data class Op<A, X>(val f : (X) -> A): OpOf<A, X>