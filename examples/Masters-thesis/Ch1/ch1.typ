#import "@local/minerva-thesis:0.2.1": *

#import "../defs.typ": * // import your own definitions




= The First Chapter <ch:firstchapter>

#lorem(50)
#abbr.add("DOF", "Degree of Freedom", "Degrees of Freedom")

This is the first occurrence of the term #abbr.a("DOF").

This is the second occurrence of the term #abbr.a("DOF") or in plural: #abbr.pla("DOF").

== The First Section  <sctn:firstsection>


$ cos^2alpha = frac(1+cos 2 alpha,2) $ <eq:cos2alpha>


In @eq:cos2alpha a well-known trigonometry formula is given.
In @app:A you find some more, in particular in @sctn:Aformulas, e.g. @eq:sin2alpha. 

=== The First Subsection <sbsctn:firstsubsection>

See @AaBbb2025 and @CcDdd2025 for some more explanation.


#m-figure(
image("img/figure_1.svg"),
caption: [A long figure caption -- #lorem(30)],
outline-caption: [A short caption],
label: <fig:examplefigure1>
)

// Use the standard figure() function for the subfigures within m-subpar-grid()
#m-subpar-grid(
figure(image("img/subfigure_a.svg"), caption: [Subfigure a]),<subfiga>,
figure(image("img/subfigure_b.svg"), caption: [Subfigure b]),<subfigb>,
figure(image("img/subfigure_c.svg"), caption: [Subfigure c]),<subfigc>,
figure(image("img/subfigure_d.svg"), caption: [Subfigure d]),<subfigd>,
columns: 2,
caption: [A figure with subfigures: a. shows case a, b. shows ... ],
outline-caption: [A figure with subfigures],
label: <fig:examplefigure2>, 
)


#lorem(30)

@fig:examplefigure2 consists of 4 subfigures:
- @subfiga: case a
- @subfigb: case b
- @subfigc: case c
- @subfigd: case d


#m-figure(
table(
[1], [2.4],
[2], [3.6],
columns:2),
caption: [A simple table with a long caption -- #lorem(30)],
label: <tbl:table1>
)

#m-figure(
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


The Maxwell stress tensor $tTM$ is given by:

$ tTM =  vB vH - 1/2 mu_0 H^2 tI $ <eq:TM>
where $vB$, $vH$ are the magnetic flux density and field strength respectively and $tI$ is the unity tensor.

The expression given by @eq:TM has been derived by #cite(<EeFff2025>, form: "prose") and is widely used  @GgHhh2025 @IiJjj2025.


=== Another Subsection

#lorem(5)
