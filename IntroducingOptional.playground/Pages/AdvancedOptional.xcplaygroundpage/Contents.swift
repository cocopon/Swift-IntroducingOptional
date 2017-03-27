//: [トップ](Top) | [前のページ](@previous)
import Foundation


//: # Optionalのもう少し高度な操作
// 前のページでは、強制的なunwrapの例を挙げましたが、他にも便利な操作が用意されています


//: ## 「??」演算子
// Optionalには「??」という便利な演算子が用意されていて、このように使います
//: - example: `(Optionalな変数) ?? (空だった場合のデフォルト値)`
var optionalMessage: String? = "hello!"
var emptyMessage: String? = nil

optionalMessage ?? "hi!"
// -> "hello!"
// 値が入っているので、前者が採用される

emptyMessage ?? "hi!"
// -> "hi!"
// 空なので、後者のデフォルト値が採用される


// 「??」演算子を使った場合の型を見てみましょう
type(of: optionalMessage ?? "hi!")
type(of: emptyMessage ?? "hi!")
// -> String.Type


// 中身が入っていればそれを、空だったら他の値を使うということは、「??」演算子を使うと必ず中身が入ることになります
// つまり、Optionalが外れるのです
// これもunwrapの一種ですね


//: ## switch文による分岐
// switch文を利用することで、条件分岐を綺麗に書くことができます
switch (optionalMessage) {
case .none:
    print("空だったとき")
case .some("hi!"):
    print("中身が入っていて、かつ \"hi!\" だったとき")
case .some("hello!"):
    print("中身が入っていて、かつ \"hello!\" だったとき")
default:
    print("上記のどれにも該当しないとき")
}


// .none や .some(...) など、見慣れない記法がありますね
// なぜこう書けるかを理解するには、もう少し細かな話が必要になりますので、今回は割愛します
// はじめのうちは、このように書けるんだね、という理解で十分だと思います


//: ## force unwrapの危険性とその対策
// 強制的にunwrapする場合は、nilチェックで安全確認してからにしよう…というのが、前のページのお話でした


// 例えば、「メッセージが空でなければ表示する関数」を考えてみましょう
func showMessage(_ optionalMessage: String?) {
    if (optionalMessage == nil) {
        return
    }
    
    let message: String = optionalMessage!
    print(message)
}

showMessage("hello!")
// -> "hello!"
showMessage(nil)
// -> (何も表示されない)


// このくらい単純な関数であれば、nilチェックも欠かさずできるのですが…
// 人間は必ずミスを起こします
// もっと関数が複雑になってきたとき、うっかりnilチェックを忘れたまま強制的にunwrapしてしまう…なんて危険性もあるわけです


// そこで活用できるのが「optional binding」や「guard文」です


//: ### Optional Binding
// 「optional binding」とは、if文と変数の宣言を組み合わせたものです
// unwrapを試して、成功したときのみ実行したい処理を書くことができます
func showMessageOptionalBinding(_ optionalMessage: String?) {
    // Optionalな変数をunwrapしてみて…
    if let unwrappedMessage = optionalMessage {
        // 成功したら、unwrapされた変数 (unwrappedMessage) が使える
        print(unwrappedMessage)

        // 型をみると、unwrapされているのがわかる
        type(of: unwrappedMessage)
        // -> String.Type
    }
    
    // unwrappedMessage はここでは使えない
}

showMessageOptionalBinding("hello!")
// -> "hello!"
showMessageOptionalBinding(nil)
// -> 何も表示されない


//: ### guard文
// guard文を使うと、先の例と同じ処理をこのように書けます
func showMessageGuard(_ optionalMessage: String?) {
    // Optionalな変数をunwrapしてみて…
    guard let unwrappedMessage = optionalMessage else {
        // だめなら (空っぽだったら) 何もせずにおしまい
        return
    }
    
    // unwrapできたら処理を続けられる！
    // unwrapされた変数 (unwrappedMessage) が使える
    print(unwrappedMessage)
    
    // 型をみると、unwrapされているのがわかる
    type(of: unwrappedMessage)
    // -> String.Type
}

showMessageGuard("hello!")
// -> "hello!"
showMessageGuard(nil)
// -> (何も表示されない)


// ちょっと特殊な構文で、慣れるまでに時間がかかるとは思います
// しかし、強制的ではなく安全にunwrapできるので、はじめの例よりスマートです
// 慣れてきたら積極的に使っていきたいですね


//: [次のページ](@next)
