#import "@local/ugentthesis:0.1.1": ugentthesis
#import ugentthesis: *


#show: thesis.with(
  font: "Libertinus Sans", 
  fontsize: 10pt,
  mathfont: "Libertinus Math",
  mathfontsize: 10pt,
  figurefont: "Libertinus Sans",
  figurefontsize: 10pt,
  captionfont: "Libertinus Sans",
  captionfontsize: 10pt,
  equation-left-margin: auto, // auto=centered equations
  figure-fill: none, // background colour of figures
  )


// #set figure(placement: auto) // puts figures at the top or bottom of pages

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

#include "Summaries/samenvatting.typ" // Dutch summary

#include "Summaries/summary.typ" // English summary

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

// Parts are optional
#part("First Part") 

#include "Ch1/ch1.typ"

// #include "Ch2/ch2.typ"
// 
// #part("Second Part") 
// 
// #include "Ch3/ch3.typ"
// 
// #include "Ch4/ch4.typ"


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


// END APPENDICES

// BIBLIOGRAPHY

#filledoutlined[

// #bibliography()

]
