//: [トップ](Top) | [前のページ](@previous)
import UIKit


//: # 暗黙的なunwrap


//: ## Outlet宣言についている謎の「!」
// 実際にiOSアプリのコードを書いている人は、Outletの宣言で謎の「!」マークを見かけると思います
class MyViewController: UIViewController {
    // Outletの宣言
    @IBOutlet weak var usernameTextField: UITextField!
    // UITextField! の「!」って何だろう…？
    
    // ...
}


// 先に説明したforce unwrapと似ているようにも見えますが…
var optionalMessage: String? = "hello!"
var forceUnwrappedMessage: String = optionalMessage!
// こちらは変数名に「!」がついているのに対して
// Outletの例では型名 UITextField に「!」がついているので
// 見た目は似ていますが、それぞれ別のものです


//: ## 暗黙的なunwrap
// 型名に「!」がついたものは、「暗黙的なunwrap」と呼ばれています
// 英語では「implicitly unwrapping」です


// その働きは…「代入されるものが空ではないと信じて、nilチェックをしない」です
// Optionalな変数を入れても、空ではないと信じているので、エラーが出ません
var implicitlyUnwrappingMessage: String! = optionalMessage


// Outletの話に戻すと…ビューを生成した直後では、Outletはまだ設定されていません
// StoryboardやXIBの設定が反映されるのは、少しあとになります

// 生成直後の一瞬だけ、空のときがあるけれども、
// 開発者がビューコントローラーの viewDidLoad で触れる時点では、もう値が設定されている
// つまり、空ではないと信じて扱っても差し支えない、ということになります
// このようなOutletの性質には、暗黙的なunwrapが適している…というわけですね


// 気をつけなければならないのが、force unwrapと同じく、やや危険を抱えたものである…ということです
// nilであることを信じきっているので、こんないじわるをしてもビルドは成功してしまいます
var implicitlyUnwrappingMesasge2: String! = nil
// 空にはならないって信じていたのに…なんてことをするんだ！


// このあと何か操作を加えようとすると、実行時にエラーが発生して、アプリは強制終了してしまいます
//: - callout(Error): `message.appending("world")`
//-> error: EXC_BAD_INSTRUCTION


// Outletの接続忘れでアプリが落ちるのは、このためです
// 空ではないと信じているのに、何も接続されていないから、エラーが起きてしまう

// 絶対的な信頼を裏切らないようにがんばりましょう


//: ## 暗黙的なunwrapの型とその性質
// どんな型になっているのか、見てみましょう
type(of: implicitlyUnwrappingMessage)
// -> ImplicitlyUnwrappedOptional<String>.Type


// 何やら長い名前の、新しい型であることがわかります
// ちなみに、Optionalな変数をforce unwrapしたあとの型は String.Type ですから、これらは別物であることがきちんと確認できますね
type(of: optionalMessage!)
// -> String.Type


// 暗黙的なunwrapは、空ではないと信じているので、普通の型と同じように操作できます
implicitlyUnwrappingMessage.appending("world")

// 空ではないと信じているので、Optionalでないものにも代入できます
var message: String = implicitlyUnwrappingMessage