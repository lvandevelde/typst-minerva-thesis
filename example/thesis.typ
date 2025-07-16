#import "../lib/lib.typ": ugentthesis
// #import "@local/ugentthesis:0.1.1": ugentthesis
#import ugentthesis: *

// Module ugentthesis includes all functions needed for the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and bibliography). 

#show: thesis.with(
  font:"UGent Panno Text", // For Ghent University theses only. Use another font otherwise.
  fontsize: 11pt,
  figurefont: "Libertinus Sans",
  equation-left-margin: 5%, // auto = centred equations (which is the default)
  figure-fill:  luma(245) // auto = color-tertiary of Ghent University corporate identity, none = no background
  )

// full list of named arguments of thesis with their default values:
//   font: "Libertinus Sans",
//   fontsize: 10pt,
//   mathfont: "Libertinus Math",
//   mathfontsize: 10pt,
//   figurefont: "Libertinus Sans",
//   figurefontsize: 10pt,
//   captionfont: "Libertinus Sans",
//   captionfontsize: 10pt,
//   equation-left-margin: auto,
//   figure-fill: none
  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages

#set page(numbering: "i") 
#set heading(numbering: none)

// Page numbers are not shown before the first level 1 heading.

// BEGIN Title page & Jury

#[
#set text(font: "UGent Panno Text", size: 10pt) // For Ghent University theses only. Use another font otherwise.

#include "Titlepage/titlepage.typ"

#startatoddpage()

#include "Jury/jury.typ"

]

// END Title page & Jury



// BEGIN Acknowledgement, Summaries, Table of Content, List of Figures & Tables etc.  

// Level 1 headings within filledoutlined[...] are shown with a fill (dots) between the title and the page number in the outline (Table of Contents), contrary to other level 1 headings (of chapters and appendices).

#filledoutlined[ 
 
// Showing page numbers starts here as the acknowledgement has a level 1 heading. 
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

// Parts are optional. 
// part() produces a flyleaf with only the part title, indexed in the Table of Contents. 

#part("Introduction") 

#include "Ch1/ch1.typ"

#include "Ch2/ch2.typ"


#part("Methods") 

#include "Ch3/ch3.typ"

#include "Ch4/ch4.typ"


// END Chapters




// BEGIN FLYLEAF before the appendices with only "Appendices", indexed in the Table of Contents

#set heading(numbering:none) 

= Appendices

#nopagenumber() // Stops showing page numbers

// END FLYLEAF


// Settings for Appendices

#counter(heading).update(0)
#set heading(numbering: "A.1.1")
#show heading.where(level:1): set heading(supplement: [Appendix]) 


// BEGIN APPENDICES

// Page numbers are shown again from the first level 1 heading (of the first appendix in this case)
#include "AppA/appA.typ"
#include "AppB/appB.typ"

// END APPENDICES

// BEGIN BIBLIOGRAPHY

#filledoutlined[

#bibliography("references.bib", style: "ieee")  // style argument is actually not needed here because "ieee" is the default

]

// END BIBLIOGRAPHY
