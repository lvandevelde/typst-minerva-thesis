#import "../lib/lib.typ": ugentthesis
// #import "@local/ugentthesis:0.1.2": ugentthesis
#import ugentthesis: *

// Module ugentthesis includes all functions needed for the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and bibliography). 

#show: thesis.with(
//   font:"UGent Panno Text", // For Ghent University theses only. Use another font otherwise.
  fontsize: 11pt,
  equation-left-margin: 5%, // auto = centred equations (which is the default)
  figure-fill:  luma(245), // auto = color-tertiary of Ghent University corporate identity, none = no background
  )

// full list of named arguments of thesis with their default values:
//   font: "Libertinus Sans"
//   fontsize: 10pt
//   mathfont: "Libertinus Math"
//   mathfontsize: 10pt
//   figurefont: "Libertinus Sans"
//   figurefontsize: 10pt
//   captionfont: "Libertinus Sans"
//   captionfontsize: 10pt
//   equation-left-margin: auto
//   figure-fill: none
//   pager: none
//   page-width: 160mm
//   page-height: 240mm
  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages


// Page numbers are not shown yet, but only from the first first-level heading on.

#include "Titlepage/titlepage.typ"


// #include "Jury/jury.typ"
// For including the Examination Board in the Table of Contents, comment the previous line and uncomment the following 4 lines:
#frontmatter(showheading:false)[
  = Examination Board
  #include "Jury/jury.typ"
]

#show: frontmatter
 
// Showing page numbers starts here as the acknowledgement has a first-level heading. 
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
#show: appendix //otherwise

#include "AppA/appA.typ"
#include "AppB/appB.typ"

#show: backmatter

#bibliography("references.bib", style: "ieee")  // style argument is actually not needed here because "ieee" is the default
