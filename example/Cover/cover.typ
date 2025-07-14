#import "../../lib/lib.typ": titlepage
// #import "@local/ugentthesis:0.1.0": titlepage
#import titlepage: *

#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]

#titlepage(
  author: [The Student],
  title: [Thesis Title -- #lorem(10)], 
  faculty: "EA", 
  date: [Month Year], 
  description: [Doctoral dissertation submitted to obtain the academic degree of Doctor of Engineering],
  supervisors: [#(for member in yaml("../Jury/jury.yaml").at("supervisors") {(showperson(member),)}).join([ -- ])\  Department of X, Y and Z],
  ids: ([ISBN vvv-uu-zzzz-yyy-x], [NUR XXX], [Wettelijk depot: D/YYYY/aa.bbb/cc]), 
  language: "EN"
)


