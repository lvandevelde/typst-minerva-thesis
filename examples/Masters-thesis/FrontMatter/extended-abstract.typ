#import "@preview/minerva-thesis:0.2.1": *

#import "../defs.typ": *

#show: extended-abstract.with(
  font-size: 10pt,
  bibliography: "../references.yaml", 
  read: path => read(path))


#abstract-keywords[
#lorem(30)

#lorem(40)
]



= Introduction

= Methods

== Method 1

=== Principle

The Maxwell stress tensor $tTM$ is given by:

$ tTM =  vB vH - 1/2 mu_0 H^2 tI $ <ea-eq:TM>
where $vB$, $vH$ are the magnetic flux density and field strength respectively and $tI$ is the unity tensor.

The expression given by @ea-eq:TM has been derived by #cite(<eab-EeFff2025>, form: "prose") and is widely used  @eab-GgHhh2025, @eab-IiJjj2025.
 //In the extended abstract commas have to be added manually between the citations.

=== Example

#lorem(20)

#m-figure(
table(
columns:2,
[x], [y], 
[1], [2]),
caption: [A Simple Table], 
) <ea-table1>


#m-subpar-grid(
kind: table,
figure(kind:table, table(columns:4,[x], [y], [z], [u], [100], [200], [300], [400]), caption: [Part a] ), <ea-table2a>,
figure(kind:table, table(columns:4,[x], [y], [z], [u], [500], [600], [700], [800]), caption: [Part b] ), <ea-table2b>,
columns: 2,
caption: [A table with subtables], 
label: <ea-table2>
)

#m-subpar-grid(
figure(image("../Ch1/img/subfigure_a.svg"), caption: [Subfigure a]),<ea-subfig1a>,
figure(image("../Ch1/img/subfigure_b.svg"), caption: [Subfigure b]),<ea-subfig1b>,
figure(image("../Ch1/img/subfigure_c.svg"), caption: [Subfigure c]),<ea-subfig1c>,
figure(image("../Ch1/img/subfigure_d.svg"), caption: [Subfigure d]),<ea-subfig1d>,
columns: 2,
caption: [A figure with subfigures -- #lorem(7)],
placement: top,
label: <ea-examplefigure1>
)

In @ea-examplefigure1, four subfigures are shown:
 + @ea-subfig1a
 + @ea-subfig1b
 + @ea-subfig1c
 + @ea-subfig1d

#colbreak() // Manual balancing of the 2 columns at the last page of the extended abstract.
 
In @ea-table2 we see two subtables:
 + @ea-table2a
 + @ea-table2b 
 
==  Method 2

#lorem(50)

See @eab-AaBbb2025 and @eab-CcDdd2025 for more explanation.

= Conclusion

#lorem(10)


