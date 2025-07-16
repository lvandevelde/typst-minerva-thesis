#import "@local/ugentthesis:0.1.1": titlepage
#import titlepage: *

#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]

// titlepage() can (for now) be used for Ghent University theses only, but you can build a title page manually.
// In this example, the names of the supervisors are extracted from ../Jury/jury.yaml, but you can also create the supervisors argument of the titlepage function manually.

#titlepage(
  author: [The Master/PhD Student],
  title: text(hyphenate:false,[Thesis Title -- #lorem(10)]), 
  language: "EN",
  faculty: "EA", // Ghent University faculty code (see comment below), only used for selecting the proper faculty icon 
  date: [Month Year], 
  description: [Master's/Doctoral dissertation submitted to obtain the academic degree of Master/Doctor of Some Subject],
  supervisors: [#(for member in yaml("../Jury/jury.yaml").at("supervisors") {(showperson(member),)}).join([ -- ])\  Department of X, Y and Z],
  ids: ([ISBN vvv-uu-zzzz-yyy-x], [NUR XXX], [Wettelijk depot: D/YYYY/aa.bbb/cc])
)


// faculty codes:
//     Arts and Philosophy: LW
//     Law and Criminology: RE
//     Sciences: WE
//     Medicine and Health Sciences: GE
//     Engineering and Architecture: EA
//     Economics and Business Administration: EB
//     Veterinary Medicine: DI
//     Psychology and Educational Sciences: PP
//     Bioscience Engineering: BW
//     Pharmaceutical Sciences: FW
//     Political and Social Sciences: PS
