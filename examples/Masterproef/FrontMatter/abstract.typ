#import "@local/minerva-thesis:0.3.0": *

= Abstract 

#show: abstract-keywords.with(language:"en") // By default, no "Abstract---" label is shown.
In this thesis ... #lorem(20)

In @part:intro ... #lorem(10). In @ch:funda ...



The references to chapters, parts, equations etc. are automatically in English.


See  #ref(<extended-abstract>, form: "page") for an extended abstract.

// For showing the abstract label ("Abstract---"):
// #abstract-keywords(show-abstract:true)[In this thesis ...
//  #lorem(20)
// ]
