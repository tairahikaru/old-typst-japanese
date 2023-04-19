// README.typ
// https://github.com/tairahikaru/old-typst-japanese
// This file is CC BY-SA 4.0
//
// Require Typst 0.2.0 (23/04/11)

#let 現在 = "2023年4月19日現在"
#let LaTeX = { // based on LaTeX kernel
  let body = {
    [L]
    h(-0.36em)
    box(height:1em,align(top, smallcaps([a])))
    h(-0.15em)
    [T]
    h(-0.1667em)
    text(baseline: 0.2152775em)[E]
    h(-0.125em)
    [X]
  }
  style(styles => {
    let size = measure(body, styles)
    box(width: size.width, place(dy: -size.height, body))
  })
}

#show link: it => {
  set text(fill:
    if type(it.dest) == "string" {
      blue
    } else {
      cmyk(0%,100%,0%,0%)
    }
  )
  it
}

#set raw(lang: "typ")

#import "otypjc.typ": conf, tate
#show: conf.with(
  title: "old-typst-japanese README",
  author: "tairahikaru",
  date: "2023-04-19",
  abstract: [
    #link("https://github.com/typst/typst")[Typst]#" "で比較的まともに日本語を扱うための#" "
    #{現在}#strong[最新]のモジュール。
    Typst 0.2.0#" " (23/04/11) 以降が要求される。
  ],
  paper: "jis-b5",
  columns-number: 2,
  size: 10pt,
)

#outline()

= otypjp

日本語を扱うための基本的な設定をするモジュール。

#{現在}のTypstは日本語組版のためには到底機能不足のため、その場限りの対処を多く行ってる。
ユーザがパラメータを上書きした場合、予期せぬ挙動を引き起こす可能性が大いにある。

== 約物

句読点がつねにぶら下がりになる。括弧類は大丈夫だった。

連続した「約物」（句読点や括弧などのこと）の間の空白の大きさが、
一般的な日本語組版の用件に沿うようになっている。
これは、#text(spacing:100%)[chws (Contextual Half-width Spacing) ]というOpenType featureに
よって実現されており、この機能に対応していない和文フォントを用いた場合は
調整されない。

これに対応した和文フォントとしては、例えば
#link("https://github.com/simonsmh/notocjk/tree/master/system/fonts")[ここから手に入るNotoフォント]
などがある。
Typstは#" "#{現在}#link("https://github.com/typst/typst/issues/185")[#" "variableフォントに
対応していない]ので、先のリンクから入手できるフォントだけでは日本語フォントのRegular以外のウェイトを
利用することはできない。

「括弧類」は、行頭全角二分、折り返し二分。
（約物だけの幅が半角であるようなchws対応のフォントを作れば良いのだろうが、そんなOpenTypeフォントは
見たことがないのでとりあえずはこの挙動で我慢する他ない。
誰か作ってください。）

== フォント

和文はNoto Serif CJK JPに、欧文はNew Computer Modernに設定される。
このとき、和文フォントは欧文フォントの約0.921倍の大きさにスケールされる。
これにより、欧文が10~DTP~pointのとき和文がちょうど13級になる。

和文ではカーニングを抑止する。

== 行末空白抑止 <行末空白抑止>

改行
しても、
その場所に空白が挿入されることはなくなる。
ただし、欧文の後ろでの改行も同様に消えてなくなるので注意しなければならない。

これは、
```
#set text(spacing: 0%)
```
とすることによって実現している。

この処理はしばしば（特に構文の前後で）通常の欧文のword spaceの挿入処理と干渉し、
本来挿入されるべきword spaceが消えてなくなるという現象が確認されている。
このような場合には` #" " `として明示的に空白を挿入するか、それでもダメであれば
` #text(spacing: 100%) `を局所的に設定する他ない。

== 和文欧文間空白

ソースコード上で直接隣り合ってる和文と欧文のうち、間に和文欧文間空白を入れるべき箇所には
自動でword spaceが挿入される。
それ以外の箇所には手動で挿入する必要がある。
@行末空白抑止 #" "節も参照のこと。

#strike[フォントで何とかならないだろうか。]

== 縦書き

#align(center,
  tate(box(width: 32.0675mm, block[
    部分的な縦書きを行うことができる。
    Alphabetも使える。

    justificationが不完全で
    禁則処理は崩壊。

    連続した約物が調整されない。。。

    ページ全体に対して自動で適用することはできない。

    残念ながら、改行を含む場合には使い物にならない。
  ]))
)

= otypjc

日本語向けのレイアウト設定をするモジュール。
好みも入ってる。
otypjpは自動で読み込まれる。

あまり凝った調整はできず、otypjpを使用した時の文書レイアウトの設定例といったところか。

見出し直後に通常の文字の大きさを超えたオブジェクトがある場合、
その場所でページ分割が発生する可能性がある。

= License

#link("https://github.com/tairahikaru/old-typst-japanese")[Web上]で配布している。

/ otypjp.typ, otypjc.typ: #link("https://www.gnu.org/licenses/agpl-3.0.html")[AGPLv3].
/ README.typ, README.pdf: #h(0.001fr)#box(link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0]).#h(1fr)
/ scsnowman.typ: #link("https://opensource.org/license/bsd-2-clause/")[BSD 2-Clause].

scsnowman.typはHironobu Yamashita氏による#" "#LaTeX#" "向けの#" "
#link("https://github.com/aminophen/scsnowman")[scsnowmanパッケージ]（BSD 2-Clause）を元に制作した。

#import "scsnowman.typ"

#box(height: 56.875mm)[]
#v(-56.875mm)
#v(1fr)
#align(center, scsnowman.scsnowman(
  scale: 10,
  adjustbaseline: true,
  muffler: rgb(100%,0%,0%),
  arms: rgb(64.8%,16.5%,16.5%),
  snow: rgb(53%,80.8%,92%),
  hat: rgb(0%,50%,0%),
  buttons: rgb(25.5%,41%,88.4%),
  note: rgb(100%,0%,0%),
))

