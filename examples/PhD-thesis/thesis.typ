#import "@preview/minerva-thesis:0.3.0": *

#show: thesis.with(
//   font: "Libertinus Serif", 
//   caption-font: "Libertinus Serif",
//   figure-font: "Libertinus Serif",
//   subfigure-caption-font: "Libertinus Sans"
//   math-font: "New Computer Modern Math",
  language: "en",
  authors: "The PhD Candidate",
  description: [Dissertation submitted to obtain the academic degree of Doctor of Engineering],
  keywords: ("Typst", "thesis", "template"),
  title: [Thesis Title -- #lorem(10)],
  font-size: 10pt,
  chapter-title-text: (size: 20pt),
  chapter-number-text: (size: 30pt),
  part-title-text: (size: 30pt),
  part-number-text: (size: 40pt),
  equation-left-margin: 5%, // left aligned equations (with some left margin),  auto = centred equations (which is the default)
  figure-fill: auto, // auto = light-gray, none = no background
  caption-text-align: "indent",
  figure-text: (font: "Arial"),
//   subfigure-numbering: "(a)", 
//   subfigure-caption-sep: [ ],
)

  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages

#show: front-matter

#include "FrontMatter/title-page.typ"

#show: front-matter.with(show-headings:false)
= Examination Board // heading shown in the Table of Contents but not on the page itself
#hide-page-number
#include "FrontMatter/jury.typ"


#show: front-matter
 
 
#include "FrontMatter/acknowledgement.typ"

#include "FrontMatter/samenvatting.typ"

#include "FrontMatter/summary.typ"

// #set-page-number-width(2em) // 2em is the default value

#table-of-contents

#set-page-number-width(1.3em)

#list-of-tables

#list-of-figures


// List of abbreviations
#list-of-abbreviations

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

#bibliography("references.yaml")  
