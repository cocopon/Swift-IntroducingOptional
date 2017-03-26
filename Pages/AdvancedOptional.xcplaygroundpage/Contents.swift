//: [トップ](Top) | [前のページ](@previous)
import Foundation


//: # Optionalのもう少し高度な操作
// 前のページでは、強制的なunwrapの例を挙げましたが、他にも便利な操作が用意されています


//: ## 「??」演算子
// Optionalには「??」という便利な演算子が用意されていて、こんな風に使います
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


// 値が入っていればそれを、空だったら他の値を使うわけで、「??」演算子を使うと必ず値が入ります
// つまり、Optionalが取れるのです
// これもunwrapの一種ですね


//: ## guard文
//: ### force unwrapの問題点
// 強制的にunwrapする場合は、nilチェックをしたあとにしよう…という話を前のページでしましたね


// 例えば、「メッセージが空でなければ表示する関数」を考えてみましょう
func showMessage(optionalMessage: String?) {
    if (optionalMessage == nil) {
        return
    }
    
    let message: String = optionalMessage!
    print(message)
}

showMessage(optionalMessage: "hello!")
// -> "hello!"
showMessage(optionalMessage: nil)
// -> (何も表示されない)


// このくらい単純な関数であれば、nilチェックも欠かさずできるのですが…
// 人間は必ずミスを起こします
// もっと関数が複雑になってきたとき、うっかりnilチェックを忘れたまま強制的にunwrapしてしまう…なんて危険性もあるわけです


// そこで登場するのが「guard文」です


//: ### guard文
// 先の例と同じようなことを、guard文を使うとこのように書けます
func showMessageGuard(optionalMessage: String?) {
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

showMessageGuard(optionalMessage: "hello!")
// -> "hello!"
showMessageGuard(optionalMessage: nil)
// -> (何も表示されない)


// ちょっと特殊な構文で、慣れるまでに時間がかかるとは思います
// しかし、強制的ではなく安全にunwrapできるので、先の例よりスマートです
// 慣れてきたら積極的に使っていきたいですね