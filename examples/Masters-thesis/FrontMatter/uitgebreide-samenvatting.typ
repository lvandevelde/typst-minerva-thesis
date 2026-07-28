#import "@local/minerva-thesis:0.3.0": *
#import "../defs.typ": *

#show: extended-abstract.with(
  language: "nl",
//   title: [Een mooie masterproeftitel -- #lorem(10) ],
  flyleaf: false,
  font-size: 10pt,
  subfigure-numbering: default-subfigure-numbering, //restore the default value 
  subfigure-caption-sep: default-caption-separator, //restore the default value 
  subfigure-caption-prefix-text: (weight: "semibold"), 
  )


// No blank line after "#abstract-keywords[" such that the text directly follows "Samenvatting - "
#abstract-keywords[
#lorem(30)

#lorem(40)
]


= Inleiding

= Methodes

== Methode 1

=== Principe

De Maxwellspanningstensor $tTM$ is gegeven door:

$ tTM =  vB vH - 1/2 mu_0 H^2 tI $ <us-eq:TM>
met $vB$, $vH$ en $tI$ respectievelijk de magnetische inductie, de magnetische veldsterkte en de eenheidstensor.

De uitdrukking  @us-eq:TM is afgeleid door #cite(<EeFff2025>, form: "prose") en wordt veel gebruikt  @GgHhh2025, @IiJjj2025.
 //In the extended abstract commas have to be added manually between the citations.

=== Voorbeeld

#lorem(20)

#m-figure(
table(
columns:2,
[x], [y], 
[1], [2]),
caption: [Een eenvoudige tabel], 
) <us-table1>


#m-subpar-grid(
kind: table,
figure(kind:table, table(columns:4,[x], [y], [z], [u], [100], [200], [300], [400]), caption: [Deel a] ), <us-table2a>,
figure(kind:table, table(columns:4,[x], [y], [z], [u], [500], [600], [700], [800]), caption: [Deel b] ), <us-table2b>,
columns: 2,
caption: [Een tabel met deeltabellen], 
label: <us-table2>
)

#m-subpar-grid(
figure(image("../Ch1/img/subfigure_a.svg"), caption: [Deelfiguur a]),<us-subfig1a>,
figure(image("../Ch1/img/subfigure_b.svg"), caption: [Deelfiguur b]),<us-subfig1b>,
figure(image("../Ch1/img/subfigure_c.svg"), caption: [Deelfiguur c]),<us-subfig1c>,
figure(image("../Ch1/img/subfigure_d.svg"), caption: [Deelfiguur d]),<us-subfig1d>,
columns: 2,
caption: [Een figuur met deelfiguren -- #lorem(7)],
placement: top,
label: <us-examplefigure1>
)



In @us-examplefigure1 zijn er vier deelfiguren :
 + @us-subfig1a
 + @us-subfig1b
 + @us-subfig1c
 + @us-subfig1d
 

#colbreak() // column break to keep the following list together
 
In @us-table2 zien 2 twee deeltabellen:
 + @us-table2a
 + @us-table2b 
 
==  Methode 2

#lorem(100)

Zie @AaBbb2025 en @CcDdd2025 voor meer uitleg.

#m-figure([$x=y<=>y=x$], kind:"theorem", caption: [Een zeer korte stelling],label: <us-the1>)

Volgens  @us-the1, ...

= Besluit

#lorem(120)



#show bibliography: set par(spacing: 0.65em, leading: 0.65em) // decrease spacing between entries
#show bibliography: set block(above: 1.2em) // some extra space between heading and first entry (entries are in a block)
// from Typst v0.15.0 onwards:
#bibliography("../references.yaml",group: none)
