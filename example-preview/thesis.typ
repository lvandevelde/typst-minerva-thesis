#import"@preview/minerva-thesis:0.1.3": *


#show: thesis.with(
//   font:"UGent Panno Text", // For Ghent University theses only. Use another font otherwise.
  fontsize: 11pt,
  equation-left-margin: 5%, // auto = centred equations (which is the default)
  figure-fill:  luma(245), // auto = color-tertiary of Ghent University corporate identity, none = no background
  )

  
#show "et al.": [_et al._]

// #set figure(placement: auto) // puts figures at the top or bottom of pages


#include "Titlepage/titlepage.typ"

// #include "Jury/jury.typ"
// For including the Examination Board in the Table of Contents, comment the previous line and uncomment the following 5 lines:
#frontmatter(showheading:false)[
  = Examination Board
  #hidepagenumber(outline: false)
  #include "Jury/jury.typ"
]

#show: frontmatter
 
 
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
