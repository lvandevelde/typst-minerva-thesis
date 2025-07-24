#import "../../lib/lib.typ": *
//#import "@local/minerva-thesis:0.1.3": *



#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]


// In this example, the names of the supervisors are extracted from ../Jury/jury.yaml, but you can also create the supervisor(s) argument of the titlepage function manually.


#titlepage(
  author: [The PhD Candidate],
  title: text(hyphenate:false,[Thesis Title -- #lorem(10)]), 
  faculty: "EA", // Ghent University faculty code (see comment above), only used for selecting the proper faculty icon 
  date: [Month Year], 
  description: [Dissertation submitted to obtain the academic degree of Doctor of Engineering],
  supervisors: [#(for member in yaml("../Jury/jury.yaml").at("supervisors") {(showperson(member),)}).join([ -- ])\  Department of X, Y and Z],
  ids: ([ISBN vvv-uu-zzzz-yyy-x], [NUR XXX], [Wettelijk depot: D/YYYY/aa.bbb/cc]), 
  language: "EN",
  //   font: "UGent Panno Text", 
  fontsize: 10pt 
)



