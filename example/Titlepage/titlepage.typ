#import "../../lib/lib.typ": titlepage
// #import "@local/ugentthesis:0.1.2": titlepage
#import titlepage: *

// Module titlepage contains:
//   - the titlepage() function (see below)
//   - functions for loading the Ghent University and faculty logos:
//       - UGentlogo(language: <language code>) creates an image with the Ghent University logo 
//       - facultylogo(<faculty code>, language: <language code>) creates an image with a faculty logo 
//   
// <language code>:
//     English: "EN"
//     Nederlands: "NL"
//  <faculty code>:
//     Arts and Philosophy: "LW"
//     Law and Criminology: "RE"
//     Sciences: "WE"
//     Medicine and Health Sciences: "GE"
//     Engineering and Architecture: "EA"
//     Economics and Business Administration: "EB"
//     Veterinary Medicine: "DI"
//     Psychology and Educational Sciences: "PP"
//     Bioscience Engineering: "BW"
//     Pharmaceutical Sciences: "FW"
//     Political and Social Sciences: "PS"

#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]

// titlepage() can (for now) be used for Ghent University theses only, but you can build a title page manually.
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
  //   font: "UGent Panno Text", // default: current font, usually set via the font argument of thesis()
  fontsize: 10pt // default: current font size, usually set via the fontsize argument of thesis()
)



