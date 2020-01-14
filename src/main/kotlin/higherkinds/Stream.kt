import arrow.Kind
import arrow.higherkind

@higherkind
data class Stream<X>(val h: () -> X, val t: () -> Stream<X>) : Kind<ForStream, X>