#import "../../lib/lib.typ": chapterdefs
// #import "@local/ugentthesis:0.1.1": chapterdefs
#import chapterdefs: *

#import "../defs.typ": *


= The First Chapter <ch:firstchapter>

#lorem(50)

== Section 1 <sctn:firstsection>

$ cos^2alpha = frac(1+cos 2 alpha,2) $ <eq:cos2alpha>


In @eq:cos2alpha a well-known trigonometry formula is given.
In @app:A you find some more, in particular in @sctn:Aformulas, e.g. @eq:sin2alpha. 

=== Subsection 1 <sbsctn:firstsubsection>

See @AaBbb2025 and @EeFff2025 for some more explanation.

#myfigure(
image("img/figure_1.svg"),
caption: [A long figure caption -- #lorem(30)],
outline-caption: [A short caption],
label: <fig:examplefigure1>
)


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

