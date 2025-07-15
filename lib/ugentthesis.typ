#import "chapterdefs.typ": *

#let contentswitch = state("content.switch", false)
#let contentpages = state("content.pages", ())
#let currentpgnum = state("currentpgnum", true)
#let pgnumshown = state("pgnumshown", ())

#let nopagenumber() = { currentpgnum.update(false) }

#let startatoddpage() = {
  contentswitch.update(false)
  pagebreak(weak: true, to: "odd")
}

#let partnumber = counter("part")


#let part(pagenumber: false, title) = context {
  startatoddpage()
  set heading(numbering: none)
  counter(heading).update(partnumber.get())
  partnumber.step()
  show heading: it => {
    v(8mm)
    align(right, text(
      size: 72pt,
      fill: rgb(150, 150, 150),
      [Part ] + partnumber.display("I"),
    ))
    align(right, text(size: 32pt, title))
    if not pagenumber { nopagenumber() }
  }
  context heading[Part #partnumber.display("I") -- #title]
  counter(heading).update(counter(heading).get())
}


// filledoutline stores page numbers of headings of level 1 which should appear in the table of contents with dots between the title and the page number (contrary to other level 1 headings)
// chapters within filledoutlined() will be set this way in the table of contents and have no numbering in their heading
#let filledoutline = state("filledoutline", ()) 
#let filledoutlined(body, showheading: true) = {
  show heading.where(level: 1): it =>  context {
    let currentpage=here().page()
    filledoutline.update(pre => {
      pre.push(currentpage)
      pre
    })
    if showheading { it }
  }
  set heading(numbering: none)
  body
}



#let thesis(
  font: "Libertinus Sans",
  fontsize: 10pt,
  mathfont: "Libertinus Math",
  mathfontsize: 10pt,
  figurefont: "Libertinus Sans",
  figurefontsize: 10pt,
  captionfont: "Libertinus Sans",
  captionfontsize: 10pt,
  equation-left-margin: auto,
  figure-fill: none,
  doc,
) = {
  set text(font: font, size: fontsize)


  set par(justify: true)
  set list(indent: 0.5em)
  set enum(indent: 0.5em)

  set page(
    width: 160mm,
    height: 240mm,
    margin: (y: 15mm, inside: 25mm, outside: 15mm),
    header: context {
      let currentpage = here().page()
      let is-start-chapter = query(heading.where(level: 1))
        .map(it => it.location().page())
        .contains(currentpage)
      if contentswitch.get() or is-start-chapter {
        contentpages.update(it => {
          it.push(currentpage)
          it
        })
      }
    },
    footer: context {
      let currentpage = here().page()
      let has-content = contentpages.get().contains(currentpage)
      if has-content and page.numbering != none and currentpgnum.get() {
        align(
          if calc.odd(counter(page).get().first()) { right } else { left },
          counter(page).display(),
        )
        pgnumshown.update(it => {
          it.push(currentpage)
          it
        })
      }
      currentpgnum.update(true)
    },
  )


  show figure: set text(font: figurefont, size: figurefontsize)
  show figure.caption: set text(font: captionfont, size: captionfontsize)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: it => align(left, it)
  set figure(numbering: addchapternumber)

  show figure.caption: it => context {
    table(
      [*#it.supplement #it.counter.display(it.numbering)*#it.separator],
      it.body,

      column-gutter: 0.15em,
      stroke: none,
      inset: 0pt,
      align: (right, left),
      columns: 2,
    )
  }
  if figure-fill != auto { default-figure-fill.update(figure-fill) }

  show math.equation: set text(font: mathfont, size: mathfontsize)

  show math.equation.where(block: true): set align(left) if (
    equation-left-margin != auto
  )
  show math.equation.where(block: true): set block(inset: (
    left: equation-left-margin,
  )) if type(equation-left-margin) in (relative, length, ratio)

  set math.equation(
    numbering: addchapternumber,
  ) 


  let addbrackets(..num) = {
    "(" + numbering(math.equation.numbering, ..num) + ")"
  }
  show math.equation.where(block: true): it => {
    if type(it.numbering) == function and it.numbering != addbrackets {
      counter(math.equation).update(v => v - 1)
      math.equation(block: true, numbering: addbrackets, it.body)
    } else { it }
  }

  show ref: it => {
    let el = it.element
    set text(weight: "semibold") if el != none and el.func() == figure
    it
  }


  show heading: set block(below: 1em)

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    startatoddpage()
    contentswitch.update(true)
    v(8mm)
    if it.numbering != none {
      align(right, text(size: 72pt, fill: rgb(150, 150, 150), counter(
        heading,
      ).display(it.numbering)))
    }
    align(right, text(size: 32pt, hyphenate: false, it.body))
    v(10mm)
  }

  show outline: set heading(outlined: true)

  show outline.entry.where(level: 1): set block(above: 1em)

  show outline.entry: it => context {
    set box(baseline: 100%)
    let pgwidth = measure(
      (str(counter(page).final().first()).len() + 1) * [9],
    ).width // estimate of space needed for page number
    let loc = it.element.location()
    let ispgnumshow = pgnumshown.at(<enddocument>).contains(loc.page())
    link(loc, block(
      width: 100%,
      block(
        width: 100% - pgwidth, 
        if it.prefix() == none {
          box(par(
            justify: true,
            it.body()
            + [ ]
            + if ispgnumshow {
              box(
                baseline: 0%,
                width: 1fr,
                if loc.page() in filledoutline.at(<enddocument>) {
                  repeat(text(weight: "regular")[.], gap: 0.15em) // i.e. the default fill
                } else {
                 it.fill
                }
              )
            },
          ))
        } else {
          it.indented(box(text(weight: "semibold", it.prefix())), box(par(
            justify: true,
            it.body()
            + [ ]
            + { if ispgnumshow { box(baseline: 0%, width: 1fr, it.fill) } },
          )))
        })
      + if ispgnumshow { place(bottom + right, it.page()) },
    ))
  }


  show outline: it => {
    if repr(it.target) == "heading" {
      show outline.entry.where(level: 1): set text(weight: "semibold")
      show outline.entry.where(level: 1): set outline.entry(fill: none)
      it
    } else {
      it
    }
  }

  doc

  [#[] <enddocument>] // Marks the end of the document (is used by filledoutline and pgnumshown)
}
