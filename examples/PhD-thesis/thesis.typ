#import "@local/minerva-thesis:0.2.0": *

#show: thesis.with(
//   font: "Libertinus Serif", 
//   caption-font: "Libertinus Serif",
//   figure-font: "Libertinus Serif",
//   math-font: "New Computer Modern Math",
  authors: "The PhD Candidate",
  description: [Dissertation submitted to obtain the academic degree of Doctor of Engineering],
  keywords: ("Typst", "thesis", "template"),
  title: text(hyphenate:false,[Thesis Title -- #lorem(10)]),
  font-size: 10pt,
  caption-font-size: 9pt,
  figure-font-size: 9pt,
  chapter-title-font-size: 24pt, 
  chapter-number-font-size: 60pt, 
  equation-left-margin: 5%, // auto = centred equations (which is the default)
  figure-fill: luma(245), // auto = colour-tertiary of Ghent University corporate identity, none = no background
  bold-figure-ref: true,
)

  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages


#include "FrontMatter/title-page.typ"


#show: front-matter.with(show-headings:false)
= Examination Board
#hide-page-number()
#include "FrontMatter/jury.typ"


#show: front-matter
 
 
#include "FrontMatter/acknowledgement.typ"

#include "FrontMatter/samenvatting.typ"

#include "FrontMatter/summary.typ"

#set-page-number-width(1.6em)

#outline(
  title:[Table of Contents], 
  target: heading
)

#set-page-number-width(1.2em)

#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)

#outline(
  title: [List of Figures],
  target: figure.where(kind: image)
)


#show: chapter

// Parts are optional. 

#part("Introduction") 

#include "Ch1/ch1.typ"

#include "Ch2/ch2.typ"


#part("Methods") 

#include "Ch3/ch3.typ"

#include "Ch4/ch4.typ"

#part("Results")

#include "Ch5/ch5.typ"

// #show: appendix.with(flyleaf:[Appendix]) // if there is only one Appendix
#show: appendix                             // otherwise

#include "AppA/appA.typ"
#include "AppB/appB.typ"

#show: back-matter

#bibliography("references.bib", style: "ieee")  // style argument is actually not needed here because "ieee" is the default
