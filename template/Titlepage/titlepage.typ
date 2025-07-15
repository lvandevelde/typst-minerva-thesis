#import "@local/ugentthesis:0.1.1": titlepage
#import titlepage: *

#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]


// titlepage() can (for now) be used for Ghent University theses only, but you can build a title page manually.
// The supervisors are listed in ../Jury/jury.yaml, but you can also set them manually.
#titlepage(
  author: [The Student],
  title: text(hyphenate:false,[Thesis Title -- #lorem(10)]), 
  language: "EN",
  faculty: "EA", // Ghent University faculty code 
  date: [Month Year], 
  description: [Master's/Doctoral dissertation submitted to obtain the academic degree of Master/Doctor of Some Subject],
  supervisors: [#(for member in yaml("../Jury/jury.yaml").at("supervisors") {(showperson(member),)}).join([ -- ])\  Department of X, Y and Z],
  ids: ([ISBN vvv-uu-zzzz-yyy-x], [NUR XXX], [Wettelijk depot: D/YYYY/aa.bbb/cc])
)


