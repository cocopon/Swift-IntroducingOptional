//: [トップ](Top) | [前のページ](@previous)
import Foundation


//: # Optionalってどんなもの？
// まずは、普通の文字列です
var normalMessage: String = "hello!"


// Swiftの世界では、普通の文字列にはnilを入れる (= 空っぽにする) ことができません
//: - callout(Error): `var normalMessage: String = nil`
// -> Nil cannot initialize specified type 'String'
// -> nilはString型を初期化できません


// 型の末尾に「?」がついたものを、「Optional (オプショナル)」といいます
var optionalMessage: String? = "hi!"


// Optionalな変数には、nilを入れることができます
// 試しに入れてみてもエラーが出ませんね
optionalMessage = nil


// つまり、Optionalとは
// 値が入っているかもしれない、入っていないかもしれない…そんな曖昧な型なのです


//: ## Optionalの型
// よい機会なので、それぞれがどんな型になっているのか、 type(of:) で見てみましょう
type(of: normalMessage)
// -> String.Type
type(of: optionalMessage)
// -> Optional<String>.Type


// 「?」がついているほうは、 Optional<String> という型であることがわかります
// つまり、こう書いても同じ意味になります
var optionalMessage2: Optional<String> = nil


// Optionalの簡単な書きかたをSwiftが用意してくれている、というわけですね


//: [次のページ](@next)
