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

## License 

![CC image](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License.](https://creativecommons.org/licenses/by/4.0/)
