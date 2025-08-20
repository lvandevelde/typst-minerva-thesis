#import "states.typ": *

#let ugent-logo(language: "EN") = image(
  "../img/logo_UGent_" + upper(language) + ".svg",
  height: 21mm,
)
#let faculty-logo(faculty: none, language: "EN") = image(
  "../img/logo_" + upper(faculty) + "_" + upper(language) + ".svg",
  height: 10mm,
)

#let title-page(
  authors: auto,
  title: auto,
  supervisors: auto,
  multiple-supervisors: auto,
  counsellors: auto,
  multiple-counsellors: auto,
  date: auto,
  language: auto, // "EN" or "NL", case-insensitive
  faculty: auto, // faculty code, case-insensitive
  description: auto,
  ids: none, // ID(s) such as ISBN, NIR code, ... : single string/content or array
  font: auto,
  font-size: auto
) = context{
  
  let the-authors= if authors==auto {thesis-authors.get()} else {authors}
  let the-title= if title==auto {thesis-title.get()} else {title}
  let the-description= if description==auto {thesis-description.get()} else {description}
  let the-date= if date==auto {thesis-date.get()} else {date}
  let the-language= if language==auto {thesis-language.get()} else {language}
  let the-faculty= if faculty==auto {thesis-faculty.get()} else {faculty}

  let the-supervisors= if supervisors==auto {thesis-supervisors.get()} else {supervisors}
  let the-multiple-supervisors= if multiple-supervisors==auto or type(multiple-supervisors)!=bool { 
    thesis-multiple-supervisors.get()
  } else {multiple-supervisors}
  
  let the-counsellors= if counsellors==auto {thesis-counsellors.get()} else {counsellors}
  let the-multiple-counsellors= if multiple-counsellors==auto or type(multiple-counsellors)!=bool { 
    thesis-multiple-counsellors.get()
  } else {multiple-counsellors}
  
  { set text(font: font) if font!=auto 
    set text(size: font-size) if font-size!=auto 

  
    faculty-logo(faculty: the-faculty, language: the-language)

    v(2fr)

    text(size: 1.8em, weight: "bold", hyphenate: false, the-title)
    
    v(3em)
    
    align(right, { 
      set text(size: 1.2em, weight: "bold")
      if type(the-authors)==array {the-authors.join(", ", last: " and ")} else {the-authors}
    })
    v(6em)
    
    [#the-description]

    v(2em)
    
    if the-supervisors!=none { 
      par({
      if the-multiple-supervisors [*Supervisors*] else [*Supervisor*] 
      linebreak()
      if type(the-supervisors)==array {the-supervisors.join(", ", last: " and ")} else {the-supervisors}
      })
    }
    
    if the-counsellors!=none { 
      par({
      if the-multiple-counsellors [*Counsellors*] else [*Counsellor*] 
      linebreak()
      if type(the-counsellors)==array {the-counsellors.join(", ", last: " and ")} else {the-counsellors}
      })
    }
    
    v(5em)
    
    text(size: 1.1em, the-date)

    v(1fr)

    ugent-logo(language: the-language)
  }
  
  pagebreak()

  v(1fr)

  if ids!=none {
    if type(ids)==array { for id in ids [#id \ ] } else [#ids]
  }
  pagebreak(weak: true, to: "odd")
}
