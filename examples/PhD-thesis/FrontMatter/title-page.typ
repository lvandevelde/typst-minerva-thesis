#import "@local/minerva-thesis:0.2.0": *

#let showperson(person) = [
#person.prefix #person.given-name #person.surname#{if person.suffix!=none [, #person.suffix]}
]


// In this example, the names of the supervisors are extracted from ../Jury/jury.yaml, but you can also create the supervisor(s) argument of the title-page function manually.

// The title-page function can only be used for Ghent University theses.
// Install the UGent Panno Text font on your system for a Ghent University thesis and uncomment the "font: ..." line below.
// Take care that the font name on your system is exactly the same as the font argument below.
#title-page( 
  faculty: "EA", // Ghent University faculty code (see comment above), only used for selecting the proper faculty icon 
  date: [Month Year],
  language: "EN",
  supervisors: [#(for member in yaml("jury.yaml").at("supervisors") {(showperson(member),)}).join([ -- ])\  Department of X, Y and Z],
  multiple-supervisors: true,
  ids: ([ISBN vvv-uu-zzzz-yyy-x], [NUR XXX], [Wettelijk depot: D/YYYY/aa.bbb/cc]), 
  //   font: "UGent Panno Text", 
  font-size: 10pt 
)



