#let UGentlogo(language: "EN") = image(
  "../img/logo_UGent_" + upper(language) + ".svg",
  height: 21mm,
)
#let facultylogo(faculty, language: "EN") = image(
  "../img/logo_" + upper(faculty) + "_" + upper(language) + ".svg",
  height: 10mm,
)

#let titlepage(
  title: none,
  author: none,
  supervisors: none,
  date: none,
  language: "EN", // "EN" or "NL", case-insensitive
  faculty: none, // faculty code, case-insensitive
  description: none,
  ids: none, // ID(s) such as ISBN, NIR code, ... : single string/content or array
) = {
  facultylogo(faculty, language: language)

  v(8em)

  text(size: 18pt, weight: "bold", title)
  v(3em)
  align(right, text(size: 12pt, weight: "bold", author))
  v(6em)

  [#description]

  v(2em)
  [*Supervisors*

    #supervisors]

  v(5em)
  text(size: 11pt, date)

  v(1fr)

  UGentlogo(language: language)

  pagebreak()

  v(1fr)

  if type(ids) == array { for id in ids [#id \ ] } else [#ids]
}
