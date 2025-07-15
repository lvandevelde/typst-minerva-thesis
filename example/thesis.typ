#import "../lib/lib.typ": ugentthesis
// #import "@local/ugentthesis:0.1.0": ugentthesis
#import ugentthesis: *


#show: thesis.with(
  font:"UGent Panno Text",
  fontsize: 11pt,
  figurefont: "Libertinus Sans",
  equation-left-margin: 5%,
  figure-fill:  luma(245) // auto=color-tertiary
  )

#show "et al.": [_et al._]

#set figure(placement: auto)

#set page(numbering: "i") 
#set heading(numbering: none)

// BEGIN Titlepage & Jury

#[
#set text(font: "UGent Panno Text", size: 10pt) 

#include "Titlepage/titlepage.typ"

#startatoddpage()

#include "Jury/jury.typ"

]

// END Titlepage & Jury

// BEGIN Acknowledgement, Summaries, Table of Content, List of Figures & Tables etc.  
 
#filledoutlined[ 
 
#include "Acknowledgement/acknowledgement.typ"

#include "Summaries/samenvatting.typ"

#include "Summaries/summary.typ"

#outline(
  title:[Table of Contents], 
  target: heading
)

#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)

#outline(
  title: [List of Figures],
  target: figure.where(kind: image)
)

] 

// END Acknowledgement, Summaries, Table of Content, List of Figures & Tables etc.  


// Settings for Chapters:
#set page(numbering:"1")
#counter(page).update(0) 
#set heading(numbering: "1.1.1")
#show heading.where(level:1): set heading(supplement: [Chapter]) 
#counter(heading).update(0)


// BEGIN Chapters


#part("Introduction") 

#include "Ch1/ch1.typ"

#include "Ch2/ch2.typ"


#part("Methods") 

#include "Ch3/ch3.typ"

#include "Ch4/ch4.typ"


// END Chapters


// Settings for Appendices
#set heading(numbering:none)

= Appendices
#nopagenumber()

#counter(heading).update(0)
#set heading(numbering: "A.1.1")
#show heading.where(level:1): set heading(supplement: [Appendix]) 


// BEGIN APPENDICES
  
#include "AppA/appA.typ"
#include "AppB/appB.typ"

// END APPENDICES

// BIBLIOGRAPHY

#filledoutlined[

#bibliography("references.bib", style: "ieee")

]
