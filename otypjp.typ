// otypjp.typ
// https://github.com/tairahikaru/old-typst-japanese
// This file is distributed under the AGPLv3

// xspcode
// from XeLaTeX-ja (https://github.com/h20y6m/xelatexja) by Yukimasa Morimi (h20y6m) (MIT License)
#let kanji_class_allow = (
  "\\u{0370}-\\u{04FF}" +
  "\\u{1F00}-\\u{1FFF}" +
  "\\u{2000}-\\u{2013}" +
  "\\u{2016}\\u{2017}" +
  "\\u{201A}\\u{201B}" +
  "\\u{201E}-\\u{2024}" +
  "\\u{2027}-\\u{20AB}" +
  "\\u{20AD}-\\u{20CF}" +
  "\\u{2100}-\\u{2121}" +
  "\\u{2123}-\\u{2328}" +
  "\\u{232B}-\\u{243F}" +
  "\\u{2500}-\\u{27BF}" +
  "\\u{2900}-\\u{29FF}" +
  "\\u{2B00}-\\u{2BFF}" +
  "\\u{2460}-\\u{24FF}" +
  "\\u{2E80}-\\u{2EFF}" +
  "\\u{3000}\\u{3003}\\u{3004}\\u{3006}\\u{3007}\\u{3013}\\u{3013}\\u{301C}" +
  "\\u{3020}-\\u{3032}" +
  "\\u{3036}-\\u{303A}" +
  "\\u{303C}-\\u{309A}" +
  "\\u{309F}-\\u{30FA}" +
  "\\u{30FF}" +
  "\\u{3190}-\\u{319F}" +
  "\\u{31F0}-\\u{4DBF}" +
  "\\u{4E00}-\\u{9FFF}" +
  "\\u{F900}-\\u{FAFF}" +
  "\\u{FE10}-\\u{FE1F}" +
  "\\u{FE30}-\\u{FE6F}" +
  "\\u{FF00}" +
  "\\u{FF02}-\\u{FF07}" +
  "\\u{FF0A}\\u{FF0B}" +
  "\\u{FF0D}" +
  "\\u{FF0F}-\\u{FF19}" +
  "\\u{FF1C}-\\u{FF1E}" +
  "\\u{FF20}-\\u{FF3A}" +
  "\\u{FF3C}" +
  "\\u{FF3E}\\u{FF3F}" +
  "\\u{FF41}-\\u{FF5A}" +
  "\\u{FF5C}\\u{FF5E}" +
  "\\u{FF65}-\\u{FF9D}" +
  "\\u{FFA0}-\\u{FFEF}" +
  "\\u{1AFF0}-\\u{1B16F}" +
  "\\u{1F100}-\\u{1F2FF}" +
  "\\u{20000}-\\u{3FFFF}" +
  "\\u{1100}-\\u{11FF}" +
  "\\u{2F00}-\\u{2FFF}" +
  "\\u{3100}-\\u{318F}" +
  "\\u{31A0}-\\u{31EF}" +
  "\\u{A000}-\\u{A4CF}" +
  "\\u{A960}-\\u{A97F}" +
  "\\u{AC00}-\\u{D7FF}" +
  "\\u{A7}\\u{A8}\\u{B0}\\u{B1}\\u{B4}\\u{B6}\\u{D7}\\u{F7}" +
  "\\u{FE00}-\\u{FE0F}" +
  "\\u{E0100}-\\u{E01EF}" +
  "\\u{3099}\\u{309A}"
)
#let kanji_class_inhibit = (
  "\\u{00B7}\\u{30FB}\\u{FF1A}\\u{FF1B}" +
  "\\u{2014}\\u{2015}\\u{2025}\\u{2026}"
)
#let kanji_class_preonly = (
  "\\u{2018}\\u{201C}\\u{2329}\\u{3008}\\u{300A}\\u{300C}\\u{300E}\\u{3010}\\u{3014}\\u{3016}\\u{3018}\\u{301A}\\u{301D}\\u{FF08}\\u{FF3B}\\u{FF5B}\\u{FF5F}" +
  "\\u{00A1}\\u{00BF}\\u{20AC}\\u{FF40}\\u{FF62}"
)
#let kanji_class_postonly = (
  "\\u{2019}\\u{201D}\\u{232A}\\u{3001}\\u{3009}\\u{300B}\\u{300D}\\u{300F}\\u{3011}\\u{3015}\\u{3017}\\u{3019}\\u{301B}\\u{301E}\\u{301F}\\u{FF09}\\u{FF0C}\\u{FF3D}\\u{FF5D}\\u{FF60}" +
  "\\u{3002}\\u{FF0E}" +
  "\\u{00AA}\\u{00B2}\\u{00B3}\\u{00B4}\\u{00B9}\\u{00BA}\\u{02D0}\\u{2122}\\u{3005}\\u{3033}\\u{3034}\\u{3035}\\u{303B}\\u{309B}\\u{309C}\\u{309D}\\u{309E}\\u{30FC}\\u{30FD}\\u{30FE}\\u{FF01}\\u{FF1F}\\u{FF61}\\u{FF63}\\u{FF64}\\u{FF9E}\\u{FF9F}"
)
#let kanji_class = (
  kanji_class_allow +
  kanji_class_inhibit +
  kanji_class_preonly +
  kanji_class_postonly
)

#let japanese_class_postallow = (
  kanji_class_allow +
  kanji_class_postonly
)
#let japanese_class_preallow  = (
  kanji_class_allow +
  kanji_class_preonly
)

#let alphabet_class_inhibit = (
  "\\u{0021}\\u{0022}\\u{0023}\\u{0024}\\u{0025}\\u{0026}\\u{002A}\\u{002B}\\u{002D}\\u{002F}\\u{003C}\\u{003D}\\u{003E}\\u{003F}\\u{0040}\\u{005C}\\u{005E}\\u{005F}\\u{007B}\\u{007C}\\u{007D}\\u{007E}"
)
#let alphabet_class_preonly = (
  "\\u{0027}\\u{0029}\\u{002C}\\u{002E}\\u{003A}\\u{003B}\\u{005D}"
)
#let alphabet_class_postonly = (
  "\\u{0028}\\u{005B}\\u{0060}"
)

#let alphabet_class_postallow = (
  "^" +
  "\\u{0020}" + // 空白
  kanji_class +
  alphabet_class_inhibit +
  alphabet_class_postonly
)
#let alphabet_class_preallow  = (
  "^" +
  "\\u{0020}" + // 空白
  kanji_class +
  alphabet_class_inhibit +
  alphabet_class_preonly
)

#let insert_char(regex1, regex2, string, function) = {
  let regexA = regex("["+regex1+"]["+regex2+"]")
  let regex1 = regex("["+regex1+"]")
  let position = string.position(regexA)
  let match = string.find(regexA)
  let match1 = match.find(regex1)
  (
    string.slice(0, position) +
    function(
      match.slice(0, match1.len()), match.slice(match1.len(), match.len())
    ) +
    string.slice(position+match.len(), string.len())
  )
}

#let insert_xkanjiskip(it) = {
  let array = ()
  let it = it.text
  for elem in it.split(" ") {
    while elem.contains(regex("["+japanese_class_postallow+"]["+alphabet_class_preallow+"]")) {
      elem = insert_char(japanese_class_postallow, alphabet_class_preallow, elem, (c1, c2) => c1+" "+c2)
    }
    while elem.contains(regex("["+alphabet_class_postallow+"]["+japanese_class_preallow+"]")) {
      elem = insert_char(alphabet_class_postallow, japanese_class_preallow, elem, (c1, c2) => c1+" "+c2)
    }
    array.push(elem)
  }
  let it = array.join(" ")
  it
}

// font
#let japanese_class = kanji_class
#let japanese_regex = regex("["  + japanese_class + "]")
#let alphabet_regex = regex("[^" + japanese_class + "]")

#let defaults = (
  Cjascale: (0.25 * 13) / (10 * (25.4 / 72)), // 13Q / 10bp
  jmainfont: "Noto Serif CJK JP",
  jcodefont: "Noto Sans CJK JP",
  mainfont: "New Computer Modern",
  codefont: "DejaVu Sans Mono",
  emojifont: "Twitter Color Emoji",
  spacing: 100%,
  leading-ratio: 0.75,
  text-edge: true,
)

#let conf(
  Cjascale: defaults.Cjascale,
  jmainfont: defaults.jmainfont,
  jcodefont: defaults.jcodefont,
  mainfont: defaults.mainfont,
  codefont: defaults.codefont,
  emojifont: defaults.emojifont,
  spacing: defaults.spacing,
  leading-ratio: defaults.leading-ratio,
  text-edge: defaults.text-edge,
  state-arg: none,
  doc,
) = {
  set text(lang: "ja", region: "JP")

  // フォント
  set text(font: (
    mainfont, jmainfont, emojifont
  ), features: ("chws",))
  show alphabet_regex: set text(
    // regexで指定すると別の場所でのfontの指定が上書きされる
    //font: (
    //  mainfont, jmainfont, emojifont
    //),
    //top-edge: Cjascale * 0.88em,
    //bottom-edge: Cjascale * 0.12em,
    lang: "en", // for hyphenation
  )
  show japanese_regex: set text(
    //font: (
    //  jmainfont, mainfont, emojifont
    //),
    features: ("chws",),
    kerning: false,
    size: Cjascale * 1em,
    //top-edge: 0.88em,
    //bottom-edge: 0.12em,
  )
  show alphabet_regex: set text(
    top-edge: Cjascale * 0.88em,
    bottom-edge: Cjascale * 0.12em,
  ) if text-edge
  show japanese_regex: set text(
    top-edge: 0.88em,
    bottom-edge: 0.12em,
  ) if text-edge
  //set text(
  //  top-edge: Cjascale * 0.88 * 10pt,
  //  bottom-edge: Cjascale * 0.12 * 10pt,
  //)
  show raw: set text(font: (
    codefont, jcodefont, emojifont
  ), kerning: false, features:("-chws",))

  // 行末スペース対策
  set text(spacing: 0%)
  show regex("[^" + japanese_class + "]+"): set text(spacing: spacing)

  // 和文欧文間空白
  show regex(".*["+japanese_class_postallow+"]["+alphabet_class_preallow+"].*"): it => insert_xkanjiskip(it)
  show regex(".*["+alphabet_class_postallow+"]["+japanese_class_preallow+"].*"): it => insert_xkanjiskip(it)

  // 段落
  set par(
    leading: Cjascale * leading-ratio * 1em,
    justify: true,
    first-line-indent: Cjascale * 1em, // 最初の段落がインデントされない https://github.com/typst/typst/issues/311
  )

  if type(state-arg) == "state" {
    state-arg.update(s => {
      s.insert("Cjascale", Cjascale)
      s.insert("leading-ratio", leading-ratio)
      s.insert("spacing", spacing)
      s
    })
  }
  doc
}

#let tate(content, baseline: -0.1em) = {
  show regex("[" + japanese_class + "]"): it => {
    set text(
      features: ("vert", "vrt2", "vkna", "vchw"),
    )
    set text(
      features: ("-vkrn",),
    )
    box(rotate(-90deg, origin: center, it))
    h(weak:true, 0.0001fr)
  }
  show regex("[^" + japanese_class + "]"): set text(baseline: baseline)
  // rotateのregexより先に
  show regex(".*["+japanese_class_postallow+"]["+alphabet_class_preallow+"].*"): it => insert_xkanjiskip(it)
  show regex(".*["+alphabet_class_postallow+"]["+japanese_class_preallow+"].*"): it => insert_xkanjiskip(it)
  show parbreak: it => { h(1fr); it }
  show linebreak: it => { h(1fr); it }
  style(styles => {
    let size = measure(content, styles)
    box(
      width: size.height,
      height: size.width,
      {
        align(right,
          rotate(90deg, origin: center, content)
        )
      },
    )
  })
}

