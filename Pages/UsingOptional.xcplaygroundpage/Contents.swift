//: [トップ](Top) | [前のページ](@previous)
import Foundation


//: # Optionalに対する操作
// 次は、Optionalに対する操作について見ていきましょう
var normalMessage: String = "hello!"
var optionalMessage: String? = "hello!"


// 例として、文字列に別の文字列を追加したい、というケースを考えましょう
// String型の appending(_:) メソッドを使います
// https://developer.apple.com/reference/swift/string/1642791-appending


// 普通の文字列には、普通にappendingが使えますね
normalMessage.appending("world")
// -> "hello!world"


// 一方、Optionalな文字列に同じことをすると…失敗してしまいます
/*:
 - callout(Error):
   `optionalMessage.appending("world")`
*/
// -> Value of optional type 'String?' not unwrapped
//    (Optional型の 'String?' はアンラップされていません)


//: ## unwrap (アンラップ)
// 「unwrap (アンラップ)」とは何でしょうか？
// 一般的に、
// Optionalな変数、中身が入っているか入っていないかわからないものを、「wrapped」 (= ラップされたもの)
// Optionalな変数の中身を取り出す操作を「unwrap (アンラップ)」
// という表現をします
// Optionalという殻を剥がすようなイメージですね


//: ### 中身が入っているか不確定なものは、普通に操作できない
// エラーメッセージに戻ると、「unwrapされていないからだめ」と言われているようです
// もう少し平易な日本語に直すと「中身が入っているかどうかわからないのに、文字列なんか足せるか！」といった感じです
// Optionalな変数に、運よく中身が入っていれば足せますが、そうでない場合はどうすればよいのかわからず、Swiftさんが困ってしまっている状態です


//: ## Optionalに対する操作
// では、Optionalな文字列にappendingするには、どうすればよいでしょうか？
// いくつか方法があります


//: ### 1. 不確定のまま扱う
// １つ目は「不確定のまま扱う」方法です
// Optionalな変数を利用する際、末尾に「?」を付加すると、不確定のまま扱うことができます
optionalMessage?.appending("world")


// 中身が入っているかどうかわからないものに文字列を付加するわけで、その結果は
// 1. ラッキー！中身が入っていた。成功！
// 2. ざんねん、中身が空っぽだった。失敗…
// の2通りですね
// 結果が入っているかもしれない、空かもしれない…これはOptionalの性質そのものです
// つまり、結果もOptionalになるのです
// type(of:) で確かめてみましょう
type(of: optionalMessage?.appending("world"))
// -> Optional<String>.Type


//: ### 2. 強制的にunwrapする
// 2つ目は「強制的にunwrapする」です
// 「force unwrap」と呼ばれる操作です
// Optionalな変数を利用する際、末尾に「!」を付加すると、強制的に中身のあるものとして扱う、つまりunwrapすることができます
optionalMessage!.appending("world")


// unwrapするので、型はOptionalではなくなります
type(of: optionalMessage!.appending("world"))
// -> String.Type


// 1点注意しなければならないのは、これがとても*危険な操作*だ、ということです
// 先の例ではたまたま中身が入っていたので成功しましたが、そうでない場合もあるわけです
// 中身が空っぽなものを無理やりunwrapしようとすると、エラーで強制終了してしまいます
var emptyMessage: String? = nil
//: - callout(Error): `emptyMessage!.appending("world")`
// -> fatal error: unexpectedly found nil while unwrapping an Optional value
//    致命的なエラー: Optionalな値をunwrapする際の意図しないnil


// 変数の代入直後や、nilチェックを済ませたあとなど、絶対に空でないと確信できる場面でのみ使用するべきです
if optionalMessage != nil {
    optionalMessage!.appending("world")
}


//: [次のページ](@next)
