#import "@local/minerva-thesis:0.3.0": *

#show: thesis.with(
  authors: ("Student 1", "Student 2"),
  title: (nl: [Een mooie masterproeftitel -- #lorem(10) ] , en: [A nice thesis title -- #lorem(10)] ),
  keywords: ( nl: ("Masterproef", "Typst"), en: ("Master's thesis", "Typst") ),
  date: [Academic year XXXX-YYYY],
  description: [Masterproef ingediend tot het behalen van de academische graad van Master of Science in een Bepaalde Discipline],
  supervisors: ( 
    (
      nl: [Prof. dr. Aa Bbbb],
      en: [Prof. Aa Bbbb, Ph.D.]
    ), (
      nl: [Prof. dr. Cc Dddd],
      en: [Prof. Cc Dddd, Ph.D.]
    )
  ),
  counsellors: (
    nl: [Dr. Ee Ffff],
    en: [Ee Ffff, Ph.D.]
  ),
  faculty: "EA",
  language: "nl",
  figure-kinds: (
    theorem: (
      nl: (
        supplement: ("Stelling", "Stellingen"),
        outline-title: "Lijst van stellingen"
      ),
      en: (
        supplement: ("Theorem", "Theorems"),
        outline-title: "List of Theorems", 
      )
    )
  ),
  terminology: (
    section: (
      nl: ("paragraaf","paragrafen") // changes only the term for section(s) in Dutch (default is ("Paragraaf", "Paragrafen"))
    ),
//     math-equation: (supplement: none) , // No supplement in refs to equations, but keeps parentheses around the number (IEEE-style)
  ),
  paper: "a4",
  font-size: 11pt,
//   chapter-show: false, // do not show "Chapter", just the number
  figure-fill: auto, //  auto = light gray, none = no background
  subfigure-numbering: "(a)", // default: "a"
//   subfigure-caption-sep: sym.space, // default: sym.colon+sym.space (": ")
  figure-ref-text: (weight: "semibold"), // References to figures (of all kinds) put in semibold characters.
  caption-position: (theorem: top, table: top),
  header-text: (smallcaps, (size: 0.9em) ),
  header-prefix-text: (weight: "semibold"),
//   per-chapter-numbering: false,
//   appendix-numbering: "Α.1", // Α = Greek capital Alpha (U+0391)
//   appendix-numbering: "A.1", // A = Latin capital A (U+0041) = default
  )

  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages

// The title-page function can only be used for Ghent University theses.
// Install the UGent Panno Text font on your system for a Ghent University thesis and uncomment the "font: ..." line below.
// Take care that the font name on your system is the same as the font argument below.


#show: front-matter.with(show-headings: false) 

#title-page( 
//   font: "UGent Panno Text"  
)

// optional:
#include "FrontMatter/vertrouwelijkheid.typ"
#hide-page-number()
  
#include "FrontMatter/uitleg-examen.typ"
#hide-page-number()


#show: front-matter

#include "FrontMatter/dankwoord.typ"

#include "FrontMatter/gebruik-van-ai.typ"

#include "FrontMatter/samenvatting.typ"
#include "FrontMatter/abstract.typ"

#include "FrontMatter/uitgebreide-samenvatting.typ"
#include "FrontMatter/extended-abstract.typ"

#set-page-number-width(2.3em) // manual setting of the width of the page numbering in the Table of contents such that the "fill" (dotted lines) does not overlap with the page numbers

#table-of-contents

#set-page-number-width(1.2em)

// List of Abbreviations via package abbr (which has been automatically imported)
#list-of-abbreviations
// #abbr.list()

#list-of-tables

#list-of-figures

#list-of-figure-kind("theorem")



#show: chapter

// Parts are optional. 
#part("Inleiding", label: <part:intro>)


#include "Ch1/ch1.typ"


#include "Ch2/ch2.typ"


#part("Methodes", label: <part:methods>)

#include "Ch3/ch3.typ"

#include "Ch4/ch4.typ"

#part("Resultaten", label: <part:results>)

#include "Ch5/ch5.typ"


#show: appendix


#include "AppA/appA.typ"
#include "AppB/appB.typ"
#include "AppC/appC.typ"

#show: back-matter

// #bibliography("references.bib")  
#bibliography("references.yaml") 





