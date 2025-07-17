#import "../../lib/lib.typ": chapterdefs
// #import "@local/ugentthesis:0.1.2": chapterdefs
#import chapterdefs: *

// Module chapterdefs contains some functions to be used in files with chapters, appendices, etc. 
// Currently, these functions are only related to extra features for figures & tables, compared to the standard figure() function.

#import "../defs.typ": * // import your own definitions


= The First Chapter <ch:firstchapter>

#lorem(50)

== The First Section  <sctn:firstsection>

$ cos^2alpha = frac(1+cos 2 alpha,2) $ <eq:cos2alpha>


In @eq:cos2alpha a well-known trigonometry formula is given.
In @app:A you find some more, in particular in @sctn:Aformulas, e.g. @eq:sin2alpha. 

=== The First Subsection <sbsctn:firstsubsection>

See @AaBbb2025 and @EeFff2025 for some more explanation.

// Use myfigure() instead of the standard figure() function for:
//    - setting an outline-caption: a (mostly shorter) caption used in the outline (List of Tables / List of Figures)
//    - figures/tables with a coloured background 
// When using the myfigure() function, the (optional) label should be passed as an argument and not be put behind the function call.
// The standard figure() function can still be used.
#myfigure(
image("img/figure_1.svg"),
caption: [A long figure caption -- #lorem(30)],
outline-caption: [A short caption],
label: <fig:examplefigure1>
)


// mysubpargrid() is based on subpar.grid() (of package subpar) but with analogue extra features as myfigure()
// Use the standard figure() function for the subfigures within mysubpargrid()
#mysubpargrid(
figure(image("img/subfigure_a.svg"), caption: [Subfigure a]),<subfiga>,
figure(image("img/subfigure_b.svg"), caption: [Subfigure b]),<subfigb>,
figure(image("img/subfigure_c.svg"), caption: [Subfigure c]),<subfigc>,
figure(image("img/subfigure_d.svg"), caption: [Subfigure d]),<subfigd>,
columns: 2,
caption: [A long caption for a figure with subfigures -- #lorem(30)],
outline-caption: [A short caption for a figure with subfigures],
label: <fig:examplefigure2>
)

// list of extra named arguments of myfigure() / mysubpargrid() and their default values: 
//   outline-caption: auto,
//   label: none,
//   breakable: false, // if true, the figure is able to span multiple pages (experimental)
//   fill: auto, // auto =  the value of argument figure-fill in thesis(), see thesis.typ
//   inset: auto // inset of the coloured outer block, auto = the value of argument figure-inset in thesis(), see thesis.typ
// The standard arguments of figure() / subpar.grid() are still valid.

#lorem(30)

@fig:examplefigure2 consists of 4 subfigures:
- @subfiga: case a
- @subfigb: case b
- @subfigc: case c
- @subfigd: case d


#myfigure(
table(
[1], [2.4],
[2], [3.6],
columns:2),
caption: [A simple table with a long caption -- #lorem(30)],
label: <tbl:table1>
)

#myfigure(
table(
[1], [7.4],
[2], [10.6],
[3], [8.4],
columns:2),
caption: [A simple table with a long caption, but a short caption in the List of Tables -- #lorem(20)],
outline-caption: [A short caption for the outline],
label: <tbl:table2>
)

@tbl:table1 and @tbl:table2 are very basic tables.

== The Second Section

=== A Subsection

=== Another Subsection
