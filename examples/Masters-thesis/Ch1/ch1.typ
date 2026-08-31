#import "@preview/minerva-thesis:0.3.0": *

#import "../defs.typ": * // import your own definitions


#set-header-title[Introduction]

= Introduction to the Subject <ch:intro>


#lorem(50)
#abbr.add("DOF", "Degree of Freedom", "Degrees of Freedom")

This is the first occurrence of the term #abbr.a("DOF").

This is the second occurrence of the term #abbr.a("DOF") or in plural: #abbr.pla("DOF").

Single references:

@ch:funda @app:A @eq:cosalphabeta @eq:sin2alpha @sctn:intro-overview @theo:add2


Some examples of references to lists:

The basics are explained in #ref-list(<ch:intro>,<ch:funda>).

In #ref-list(<sctn:intro-context>,<sctn:intro-overview>), it will be shown that ...

The equations are explained in more detail in  #ref-list(<app:A>,<app:B>, <app:C>).


// @ch:secondchapter contains #ref-list(<theorem1>,<theorem2>).


== Context  <sctn:intro-context>


$ cos^2alpha = (1+cos 2 alpha)/2 $ <eq:cos2alpha>
$ cos(2 alpha) = cos^2alpha-sin^2alpha $ <eq:cos2xalpha>
$ cos alpha cos beta  = 1/2 (cos(alpha+beta) + cos(alpha-beta)) $ <eq:cosalphabeta>


Example of ``` ref-list```:

``` ref-list( (<eq:cos2alpha>, <eq:cosalphabeta>), <eq:sin2alpha>) show ...``` gives:

#ref-list( (<eq:cos2alpha>, <eq:cosalphabeta>), <eq:sin2alpha>) show well-known trigonometric formulas.

Example of ``` ref-range```:

``` ref-range(<eq:cos2alpha>, <eq:cosalphabeta>) ...``` gives:

#ref-range(<eq:cos2alpha>, <eq:cosalphabeta>) ...


In @app:A you find some more, in particular in @sctn:Aformulas, e.g. @eq:sin2alpha

=== The First Subsection <sbsctn:introsubsection>

See @AaBbb2025 and @CcDdd2025 for some more explanation.


#m-figure(
image("img/figure_1.svg"),
caption: [A long figure caption -- #lorem(30)],
outline-caption: [A short caption],
label: <fig:examplefigure1>
)

// Use the standard figure() function for the subfigures within m-subpar-grid()
#m-subpar-grid(
figure(image("img/subfigure_a.svg"), caption: [Subfigure a -- #lorem(10)]),<subfiga>,
figure(image("img/subfigure_b.svg"), caption: [Subfigure b -- #lorem(10)]),<subfigb>,
figure(image("img/subfigure_c.svg"), caption: [Subfigure c -- #lorem(2)]),<subfigc>,
figure(image("img/subfigure_d.svg"), caption: [Subfigure d -- #lorem(2)]),<subfigd>,
columns: 2,
caption: [A figure with subfigures. The layout of the captions of the (sub)figures (position, alignment, font, ...) is set via arguments of ``` thesis()```.],
outline-caption: [A figure with subfigures],
label: <fig:examplefigure2>, 
)


#lorem(30)

In #ref-list(<fig:examplefigure1>,<fig:examplefigure2>), some results are shown.

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


#ref-list(<tbl:table1>, <tbl:table2>) are very basic tables.

Figure of user-defined kind ``` theorem```.

#m-figure([$x=y<=>y=x$], kind:"theorem", caption: [A very short theorem],label: <theo:equality>)

According to @theo:equality, ...

== Overview <sctn:intro-overview>

=== A Subsection


The Maxwell stress tensor $tTM$ is given by:

$ tTM =  vB vH - 1/2 mu_0 H^2 tI $ <eq:TM>
where $vB$, $vH$ are the magnetic flux density and field strength respectively and $tI$ is the unity tensor.

The expression given by @eq:TM has been derived by #cite(<EeFff2025>, form: "prose") and is widely used  @GgHhh2025 @IiJjj2025.


=== Another Subsection

#lorem(5)

== The Third Section

#lorem(10)

#m-subpar-super(
grid(
  grid.cell(colspan: 2, [#figure(image("img/subfigure_a.svg"), caption: [Subfigure a -- #lorem(20)]) <subfig2a>]),
  [#figure(image("img/subfigure_b.svg"), caption: [Subfigure b]) <subfig2b>],
  [#figure(image("img/subfigure_c.svg"), caption: [/*Subfigure c*/]) <subfig2c>],
  grid.cell(colspan: 2, [#figure(image("img/subfigure_d.svg"), caption: [Subfigure d -- #lorem(25)]) <subfig2d>]),
  columns: 2, gutter: 1em,
),
caption: [A long caption for a figure with subfigures (via ``` m-subpar-super```) -- #lorem(30)],
outline-caption: [A short caption for a figure with subfigures (via ``` m-subpar-super```)],
label: <fig:examplefigure3>
)



