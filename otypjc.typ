// otypjc.typ
// https://github.com/tairahikaru/old-typst-japanese
// This file is distributed under the AGPLv3
//
// Require Typst 0.2.0 (23/04/11)

// from typst (https://github.com/typst/typst) (Apache License 2.0)
// typst/library/src/layout/page.rs
#let papersize-dict = (
  a0: (841.0mm, 1189.0mm),
  a1: (594.0mm, 841.0mm),
  a2: (420.0mm, 594.0mm),
  a3: (297.0mm, 420.0mm),
  a4: (210.0mm, 297.0mm),
  a5: (148.0mm, 210.0mm),
  a6: (105.0mm, 148.0mm),
  a7: (74.0mm, 105.0mm),
  a8: (52.0mm, 74.0mm),
  a9: (37.0mm, 52.0mm),
  a10: (26.0mm, 37.0mm),
  a11: (18.0mm, 26.0mm),
  iso-b1: (707.0mm, 1000.0mm),
  iso-b2: (500.0mm, 707.0mm),
  iso-b3: (353.0mm, 500.0mm),
  iso-b4: (250.0mm, 353.0mm),
  iso-b5: (176.0mm, 250.0mm),
  iso-b6: (125.0mm, 176.0mm),
  iso-b7: (88.0mm, 125.0mm),
  iso-b8: (62.0mm, 88.0mm),
  iso-c3: (324.0mm, 458.0mm),
  iso-c4: (229.0mm, 324.0mm),
  iso-c5: (162.0mm, 229.0mm),
  iso-c6: (114.0mm, 162.0mm),
  iso-c7: (81.0mm, 114.0mm),
  iso-c8: (57.0mm, 81.0mm),
  din-d3: (272.0mm, 385.0mm),
  din-d4: (192.0mm, 272.0mm),
  din-d5: (136.0mm, 192.0mm),
  din-d6: (96.0mm, 136.0mm),
  din-d7: (68.0mm, 96.0mm),
  din-d8: (48.0mm, 68.0mm),
  sis-g5: (169.0mm, 239.0mm),
  sis-e5: (115.0mm, 220.0mm),
  ansi-a: (216.0mm, 279.0mm),
  ansi-b: (279.0mm, 432.0mm),
  ansi-c: (432.0mm, 559.0mm),
  ansi-d: (559.0mm, 864.0mm),
  ansi-e: (864.0mm, 1118.0mm),
  arch-a: (229.0mm, 305.0mm),
  arch-b: (305.0mm, 457.0mm),
  arch-c: (457.0mm, 610.0mm),
  arch-d: (610.0mm, 914.0mm),
  arch-e1: (762.0mm, 1067.0mm),
  arch-e: (914.0mm, 1219.0mm),
  jis-b0: (1030.0mm, 1456.0mm),
  jis-b1: (728.0mm, 1030.0mm),
  jis-b2: (515.0mm, 728.0mm),
  jis-b3: (364.0mm, 515.0mm),
  jis-b4: (257.0mm, 364.0mm),
  jis-b5: (182.0mm, 257.0mm),
  jis-b6: (128.0mm, 182.0mm),
  jis-b7: (91.0mm, 128.0mm),
  jis-b8: (64.0mm, 91.0mm),
  jis-b9: (45.0mm, 64.0mm),
  jis-b10: (32.0mm, 45.0mm),
  jis-b11: (22.0mm, 32.0mm),
  sac-d0: (764.0mm, 1064.0mm),
  sac-d1: (532.0mm, 760.0mm),
  sac-d2: (380.0mm, 528.0mm),
  sac-d3: (264.0mm, 376.0mm),
  sac-d4: (188.0mm, 260.0mm),
  sac-d5: (130.0mm, 184.0mm),
  sac-d6: (92.0mm, 126.0mm),
  iso-id-1: (85.6mm, 53.98mm),
  iso-id-2: (74.0mm, 105.0mm),
  iso-id-3: (88.0mm, 125.0mm),
  asia-f4: (210.0mm, 330.0mm),
  jp-shiroku-ban-4: (264.0mm, 379.0mm),
  jp-shiroku-ban-5: (189.0mm, 262.0mm),
  jp-shiroku-ban-6: (127.0mm, 188.0mm),
  jp-kiku-4: (227.0mm, 306.0mm),
  jp-kiku-5: (151.0mm, 227.0mm),
  jp-business-card: (91.0mm, 55.0mm),
  cn-business-card: (90.0mm, 54.0mm),
  eu-business-card: (85.0mm, 55.0mm),
  fr-tellière: (340.0mm, 440.0mm),
  fr-couronne-écriture: (360.0mm, 460.0mm),
  fr-couronne-édition: (370.0mm, 470.0mm),
  fr-raisin: (500.0mm, 650.0mm),
  fr-carré: (450.0mm, 560.0mm),
  fr-jésus: (560.0mm, 760.0mm),
  uk-brief: (406.4mm, 342.9mm),
  uk-draft: (254.0mm, 406.4mm),
  uk-foolscap: (203.2mm, 330.2mm),
  uk-quarto: (203.2mm, 254.0mm),
  uk-crown: (508.0mm, 381.0mm),
  uk-book-a: (111.0mm, 178.0mm),
  uk-book-b: (129.0mm, 198.0mm),
  us-letter: (215.9mm, 279.4mm),
  us-legal: (215.9mm, 355.6mm),
  us-tabloid: (279.4mm, 431.8mm),
  us-executive: (84.15mm, 266.7mm),
  us-foolscap-folio: (215.9mm, 342.9mm),
  us-statement: (139.7mm, 215.9mm),
  us-ledger: (431.8mm, 279.4mm),
  us-oficio: (215.9mm, 340.36mm),
  us-gov-letter: (203.2mm, 266.7mm),
  us-gov-legal: (215.9mm, 330.2mm),
  us-business-card: (88.9mm, 50.8mm),
  us-digest: (139.7mm, 215.9mm),
  us-trade: (152.4mm, 228.6mm),
  newspaper-compact: (280.0mm, 430.0mm),
  newspaper-berliner: (315.0mm, 470.0mm),
  newspaper-broadsheet: (381.0mm, 578.0mm),
  presentation-16-9: (297.0mm, 167.0625mm),
  presentation-4-3: (280.0mm, 210.0mm),
)

#let papersize-parse(paper: none, default: "a4", width: none, height: none, flipped: false) = {
  let func(paper) = {
    let paper = papersize-dict.at(paper)
    let func(w, h) = {
      if flipped {
        return (width: h, height: w)
      } else {
        return (width: w, height: h)
      }
    }
    func(
      if width == none {paper.first()} else {width},
      if height == none {paper.last()} else {height},
    )
  }
  func(
    if paper == none {default} else {paper}
  )
}

#let inner-state = state("otypjp-inner", (:))
#let tate(it) = {
  locate(loc => {
    inner-state.final(loc).at("tate")(
      it
    )
  })
}

#let numbering-parser(pattern, array) = {
  if pattern == none { return none }
  if array == () { return none }
  let func = eval(
    "(pattern) => { numbering(pattern, " + array.map(str).join(",") +  ")  }"
  )
  return func(pattern)
}

#let conf(
  title: none,
  author: none,
  abstract: none,
  date: none,
  paper: "a4",
  flipped: false,
  columns-number: 1,
  size: 10pt,
  //titlepage: false,
  //twoside: false,
  //open: "any",
  columnwidth: auto,
  columnsep-number: 2,
  //lines: auto,
  //topmargin: auto,
  //bottommargin: auto,
  //innermargin: auto,
  //outermargin: auto,
  //chapter: false,
  simpleref: true,
  state-arg: state("otypejc"),
  doc
) = {
  set document(
    title: title,
  ) if title != none
  set document(
    author: author,
  ) if author != none
  import "otypjp.typ"

  // parameters
  let Cjascale = otypjp.defaults.Cjascale
  let leading-ratio = otypjp.defaults.leading-ratio
  let otypjp-tate = otypjp.tate
  let otypjp = otypjp.conf

  show: otypjp.with(
    Cjascale: Cjascale,
    leading-ratio: leading-ratio,
    text-edge: false,
  ) // 引数指定できない
  set text(
    size: size,
  )
  let Cwd = Cjascale * size
  let cwd = Cwd // 本当はrelative lengthにしたいけどCjascaleとの絡みで無理
  let Leading = leading-ratio * Cwd
  let leading = Cjascale * leading-ratio * 1em
  let normalleading = Leading // 本当はrelative lengthにしたい
  let Cdp = 0.12 * Cwd
  let cdp = 0.12 * cwd
  let Cht = 0.88 * Cwd
  let cht = 0.88 * cwd

  // レイアウト
  set block(spacing: 0pt) // parskip
  let (width: paperwidth, height: paperheight) = papersize-parse(paper: paper, flipped: flipped)
  let columnsep = columnsep-number * Cwd
  set columns(
    gutter: columnsep,
  )
  let textwidth = calc.round((paperwidth - columnsep * (columns-number - 1)) * 0.8 / Cwd / columns-number) * Cwd * columns-number + columnsep * (columns-number - 1)
  let textheight = calc.round((paperheight - Cwd) * 0.8 / (Cwd + Leading)) * (Cwd + Leading) + Cwd
  let topmargin = ( paperwidth - textwidth ) / 2
  let sidemargin = ( paperheight - textheight) / 2
  set page(
    margin: (
      x: topmargin,
      y: sidemargin,
    ),
    width: paperwidth,
    height: paperheight,
    numbering: "1",
    header: locate(loc => {
      if title != none and loc.page() == 1 { return }
      // 現在ページ最初の本文に適用される見出し
      let func(search) = {
        let elems = query(search, after: loc)
        if elems == () {
          let elems = query(search, before: loc)
          if elems == () {
            return none
          } else {
            return elems.last()
          }
        } else {
          let eloc = elems.first().location()
          if (
            (eloc.page() == loc.page())
            and (eloc.position().y < sidemargin + Cwd)
            and (eloc.position().x < topmargin + Cwd)
          ) {
            // そのページが見出しで始まり、かつその見出しである
            return elems.first()
          } else {
            let elems = query(search, before: loc)
            if elems == () {
              return none
            } else {
              return elems.last()
            }
          }
        }
      }
      let head1 = func(
        heading.where(level: 1, outlined: true),
      )
      let head2 = func(
        heading.where(level: 2, outlined: true),
      )
      let mark(head) = {
        if head != none {
          let numbers = numbering-parser(head.numbering, counter(heading).at(head.location()))
          [#numbers#h(1em)#head.body]
        }
      }
      if head1 == none and head2 == none {
        align(center, title)
      } else {
        mark(head1) + h(1fr)
        if head1 == none or head2 == none or counter(heading).at(head1.location()).first() == counter(heading).at(head2.location()).first() {
          mark(head2)
        }
      }
    }),
  )
  counter(page).update(1)

  // 見出し
  set heading(numbering: "1.1.1.1")
  show heading: set par(first-line-indent: 0pt)
  show heading: set block(spacing: 0pt)
  show heading: it => {
    let height = (Cwd + Leading) * (2-1) + Leading
    {
      set par(leading: Leading)
      set block(spacing: Leading)
      let height = height + (Cwd + Leading) * 3 // 直後の段落が1行の場合不必要に改ページ（オーファン対策）
      parbreak()
      set text(size: 0pt)
      box(height: height)[] //  needspace
      parbreak() // do not break here
      v(-height)
      v(-Leading)
    }
    set block(spacing: 0pt)
    set par(first-line-indent: 0pt)
    locate(loc => {
      let head = {
        if it.numbering != none {
          numbering-parser(it.numbering, counter(heading).at(loc))
          h(cwd)
        }
        it.body
      }
      style(styles => {
        let size = measure(head, styles)
        let margin = (height - size.height) / 2
        set par(leading: Leading)
        v(margin)
        box(height: height, inset: 0pt, outset: 0pt, fill: none, {
          head
        })
        v(-margin)
      })
    })
    parbreak()// do not break here
  }

  // 目次
  show outline: set par(first-line-indent: 0pt)
  show outline: it => {
    let setdefault(field, default) = {
      if it.has(field) {
        return it.at(field)
      } else {
        return default
      }
    }
    let title = setdefault("title", [目次])
    let target = setdefault("target", heading.where(outlined: true))
    let depth = setdefault("depth", none)
    let indent = setdefault("indent", true)
    let fill = setdefault("fill", repeat[.#h(0.5em)])
    let pnumwidth = 2 * cwd
    let lnumwidth = 4 * cwd
    set par(first-line-indent: 0pt)
    heading(level:1, outlined: false, title, numbering: none)
    locate(loc => {
      for elem in query(target, loc) {
        if depth != none and "level" in elem.keys() and depth < elem.level { continue }
        box(width: 100% - pnumwidth, fill)
        h(-(100%-pnumwidth))
        link(elem.location(), {
          box(fill: white, {
            box(width: lnumwidth, {
              if indent {  h(cwd * (elem.level - 1)) }
              numbering-parser(elem.numbering, counter(heading).at(elem.location()))
              h(1fr)
            })
            elem.body
            h(1em)
          })
          h(1fr)
          [#elem.location().page()]
        })
        parbreak()
      }
    })
  }

  // リスト
  let zerobox(width, alignment: right, body) = {
    box(width: 0pt, {h(-100pt); h(1fr); box(width: width, align(alignment, body))})
  }
  set list(
    marker: (
      zerobox(cwd, alignment: center, [• ]),
      zerobox(cwd, alignment: center, [--]),
      zerobox(cwd, alignment: center, [∗]),
      zerobox(0pt, [・]),
    ),
    body-indent: 0pt,
    indent: 2 * cwd,
  )
  let enum-numbering(..nums) = {
    let nums = nums.pos().enumerate()
    box(width: 0pt, {
      h(-1000pt); h(1fr)
      let (index, value) = nums.last()
      if index == 0 {
        numbering("1.", value)
      } else if index == 1 {
        numbering("(a)", value)
      } else if index == 2 {
        numbering("i.", value)
      } else {
        numbering("A.", value)
      }
      h(0.5 * cwd)
    })
  }
  set enum(
    numbering: enum-numbering,
    full: true,
    body-indent: 0pt,
    indent: 2 * cwd,
  )
  set terms(
    indent: 0pt,
    hanging-indent: 2 * cwd,
    separator: h(cwd),
  )
  show terms: set par(first-line-indent: 0pt)
  let dummypar(it) = {
    it
    parbreak()
    set text(0pt)
    box[]
    parbreak()
    v(-Leading)
  }
  show list: dummypar
  show enum: dummypar
  show terms: dummypar

  // raw
  show raw: set text(
    size: size * 0.8,
    top-edge: cht,
    bottom-edge: cdp,
  )

  set text(
    top-edge: cht,
    bottom-edge: cdp,
  )
  let headfont(body) = {
    set text(weight: 800)
    body
  }
  show emph: it => { strong(it.body) }

  // 日本語化
  set figure(kind: "図", supplement: "図")
  set outline(title: "目次")
  set heading(supplement: "") // これが一番マシ
  show ref: it => {
    if not simpleref { return it }
    else {
      locate(loc => {
        let elem = query(it.target, loc).first()
        let func(elem) = {
          if elem.has("counter") { return elem.counter }
          else { return counter(elem.func()) }
        }
        let count = func(elem)
        link(it.target, numbering-parser(elem.numbering, count.at(elem.location())))
      })
    }
  }
  inner-state.update(s => {
    s.insert("tate", otypjp-tate)
    s
  })
  parbreak()
  show block: it => {
    linebreak()
    it.body
    linebreak()
  }
  if title != none {
    let maketitle = {
      align(center, text(1.7 * Cwd, title))
      if author != none {
        align(center, text(1.1 * Cwd, author))
      }
      if date != none {
        align(center, text(1.1 * Cwd, date))
      }
      if abstract != none {
        v(0.5 * Cwd)
        align(center, {
          headfont("概要")
          v(0.25 * Cwd)
          parbreak()
          box(width: calc.round(0.8 * textwidth / Cwd) * Cwd, {
            box[]
            parbreak()
            v(-Leading)
            set align(left)
            abstract
          })
        })
      }
      v(0.5 * Cwd)
      parbreak()
    }
    set block(spacing: normalleading)
    set par(leading: normalleading)
    style(styles => {
      let height = measure(maketitle, styles).height
      let margin = (calc.ceil((height - Cwd) / (Cwd+Leading)) * (Cwd+Leading) + Cwd) - height
      box(height: height, width: 100%, place(center, maketitle))
      parbreak()
      v(margin)
      v(-normalleading)
      v(-cdp)
    })
  }
  set block(spacing: leading)
  columns(
    columns-number,
    {
      {
        set text(size: 0pt)
        box[]
      }
      parbreak()
      set block(spacing: normalleading)
      set par(leading: normalleading)
      doc
    },
  )
}

