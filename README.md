### Kotlin sample code for Bartosz Milewski's [Category Theory for Programmers](https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/)

[![Build Status](https://travis-ci.org/arrow-kt/Category-Theory-for-Programmers.kt.svg)](https://travis-ci.org/arrow-kt/Category-Theory-for-Programmers.kt)

## Contributing
Contributions (PR, review, issues) are welcome!
If you are interested, please indicate that you are working on in the respective issues. [You can find the issues for each chapter here here.](https://github.com/arrow-kt/Category-Theory-for-Programmers.kt/issues). Feel free to claim an issue you want to work on by adding a comment. Someone will then move it to `In progress` in the [project board](https://github.com/arrow-kt/Category-Theory-for-Programmers.kt/projects/1)

We discuss Arrow and development of FP in general in Kotlin in the
[Kotlin Community Slack](https://slack.kotlinlang.org) in the [arrow](https://kotlinlang.slack.com/messages/C5UPMM0A0) and [arrow-contributors](https://kotlinlang.slack.com/messages/C8UK6RTHU) channels. 

Build the project with:

```
./gradlew runAnk
```

## Spaces and indentation

Please use 2 spaces to indent your code.

## Type-check your code

Use **\`\`\`kotlin:ank:silent\`\`\`** for code that is compilable, use **\`\`\`kotlin\`\`\`** otherwise.

Use a line of `.............` to separate between code examples. 

### functions vs. methods

If it's a "standalone" function, use the function syntax, i.e.
```kotlin
val f: (A) -> B
```

If it is inside an interface or class, use the method, i.e.

```kotlin
fun f(a: A) : B
```

### Λnk

- The Docs for [Λnk](https://github.com/arrow-kt/arrow/tree/master/modules/ank) without ank:playground 

- If you define / redefine type classes please define them within a playground environment.
```markdown
```kotlin:ank:playground
import arrow.data.ForListK
import arrow.data.ListK
import arrow.Kind
import arrow.data.fix
import arrow.typeclasses.Functor

interface ListKFunctor : Functor<ForListK> {
    override fun <A, B> Kind<ForListK, A>.map(f: (A) -> B): ListK<B> =
        fix().map(f)
}
```... 
```
[Playground Docs](https://github.com/arrow-kt/arrow-playground).
But for now a basic set-up as the snippet above is sufficient. Remember that ank:playground wont make the code snippet global for other snippets.

- In some instances (in the context of coroutine examples) Λnk won't process very long (over ~160 lines) md files. Split them up into < chapter >-Part1.md , < chapter >-Part2.md

- Debug with (optionally add the --stacktrace)
```gradle
   gradle runAnk
```
## License 

![CC image](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License.](https://creativecommons.org/licenses/by/4.0/)
