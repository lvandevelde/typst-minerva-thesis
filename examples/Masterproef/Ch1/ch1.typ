#import "@preview/minerva-thesis:0.3.0": *

#import "../defs.typ": * // import your own definitions


#set-header-title[Inleiding]

= Inleiding tot het onderwerp <ch:intro>


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


Voorbeeld van een ``` ref-list```:

``` ref-list( (<eq:cos2alpha>, <eq:cosalphabeta>), <eq:sin2alpha>) show ...``` geeft:

#ref-list( (<eq:cos2alpha>, <eq:cosalphabeta>), <eq:sin2alpha>) tonen bekende goniometrische identiteiten.

Voorbeeld van een ``` ref-range```:

``` ref-range(<eq:cos2alpha>, <eq:cosalphabeta>) ...``` geeft:

#ref-range(<eq:cos2alpha>, <eq:cosalphabeta>) ...


In @app:A staan nog meer vergelijkingen, in het bijzonder in @sctn:Aformules, e.g. @eq:sin2alpha

=== De eerste subparagraaf <sbsctn:introsubsection>

Zie @AaBbb2025 and @CcDdd2025 voor meer uitleg.


#m-figure(
image("img/figure_1.svg"),
caption: [Een lang onderschrift -- #lorem(30)],
outline-caption: [Een kort onderschrift],
label: <fig:examplefigure1>
)

// Use the standard figure() function for the subfigures within m-subpar-grid()
#m-subpar-grid(
figure(image("img/subfigure_a.svg"), caption: [Deelfiguur a -- #lorem(10)]),<subfiga>,
figure(image("img/subfigure_b.svg"), caption: [Deelfiguur b -- #lorem(10)]),<subfigb>,
figure(image("img/subfigure_c.svg"), caption: [Deelfiguur c -- #lorem(2)]),<subfigc>,
figure(image("img/subfigure_d.svg"), caption: [Deelfiguur d -- #lorem(2)]),<subfigd>,
columns: 2,
caption: [Een figuur met deelfiguren. De onderschriften van de (deel)figuren (_position_, _alignment_, _font_, ...) is ingesteld via argumenten van ``` thesis()```.],
outline-caption: [Een figuur met deelfiguren],
label: <fig:examplefigure2>, 
)


#lorem(30)

In #ref-list(<fig:examplefigure1>,<fig:examplefigure2>) worden enkele resultaten getoond.

@fig:examplefigure2 bestaat uit 4 deelfiguren:
- @subfiga: geval a
- @subfigb: geval b
- @subfigc: geval c
- @subfigd: geval d


#m-figure(
table(
[1], [2.4],
[2], [3.6],
columns:2),
caption: [Een eenvoudige tabel met een lang opschrift -- #lorem(30)],
label: <tbl:table1>
)

#m-figure(
table(
[1], [7.4],
[2], [10.6],
[3], [8.4],
columns:2),
caption: [Een eenvoudige tabel met een lang opschrift, maar met een kort opschrift voor de lijst van tabellen -- #lorem(20)],
outline-caption: [Een kort opschrift voor de lijst van tabellen],
label: <tbl:table2>
)


#ref-list(<tbl:table1>, <tbl:table2>) zijn zeer eenvoudige tabellen.

Een figuur met een door de gebruiker gedefineerde type ``` theorem```:

#m-figure([$x=y<=>y=x$], kind:"theorem", caption: [Een heel korte stelling],label: <theo:equality>)

Volgens @theo:equality, ...

== Overzicht <sctn:intro-overview>

=== Een subparagraaf


De  Maxwell-spanningstensor $tTM$ is gegeven door:

$ tTM =  vB vH - 1/2 mu_0 H^2 tI $ <eq:TM>
met $vB$ en $vH$ respectievelijk de magnetische inductie en veldsterkte en $tI$ de eenheidstensor.

De uitdrukking gegeven door @eq:TM werd afgeleid door #cite(<EeFff2025>, form: "prose") en wordt vaak gebruikt  @GgHhh2025 @IiJjj2025.


=== Een andere subparagraaf

#lorem(5)

== De derde paragraaf

#lorem(10)

#m-subpar-super(
grid(
  grid.cell(colspan: 2, [#figure(image("img/subfigure_a.svg"), caption: [Deelfiguur a -- #lorem(20)]) <subfig2a>]),
  [#figure(image("img/subfigure_b.svg"), caption: [Deelfiguur b]) <subfig2b>],
  [#figure(image("img/subfigure_c.svg"), caption: [/*Deelfiguur c*/]) <subfig2c>],
  grid.cell(colspan: 2, [#figure(image("img/subfigure_d.svg"), caption: [Deelfiguur d -- #lorem(25)]) <subfig2d>]),
  columns: 2, gutter: 1em,
),
caption: [Een lang onderschrift voor een figuur met deelfiguren (via ``` m-subpar-super```) -- #lorem(30)],
outline-caption: [Een kort onderschrift voor een figuur met deelfiguren (via ``` m-subpar-super```)],
label: <fig:examplefigure3>
)



