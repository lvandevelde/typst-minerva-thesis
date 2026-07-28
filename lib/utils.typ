#import "@preview/icu-datetime:0.2.1" as icu
#import "settings.typ": *
#import "states.typ": *


#let merge-dictionaries(orig, plus)={
  if type(orig)==dictionary and type(plus)==dictionary {
    let merged=(:)
    for (key, value) in orig {
        if key in plus {
          merged.insert(key, merge-dictionaries(value, plus.at(key)))
        } else {merged.insert(key, value)}
    }
    for (key, value) in plus {
      if key not in orig {merged.insert(key, value)}
    }
    merged
  } else {plus}
}

#let compose-locale(language, region: auto)={
  let the-region=if region==auto {default-region.at(language, default: none)} else {region}
  lower(language)+if the-region!=none {locale-sep+upper(the-region)}
}


#let locales=state("locales",(m: compose-locale(default-language))) // must be initialised, otherwise problems with getting current locale 

#let current-locale()={locales.get().at(store.get(), default: none)}

#let set-locale(locale, store: none)={
  locales.update(it => it+(store: locale))
}

#let split-locale(locale, region: auto)={
  let the-locale=(if type(locale)==str {locale}  else {current-locale()})
  if the-locale!=none {
    the-locale=the-locale.split(locale-sep)
    let language=the-locale.at(0)
    let region=if the-locale.len()>1 {the-locale.at(1)} else { if region==auto  {default-region.at(language, default: none)} else {region}  }
    (language: language,  region: region, locale: compose-locale(language, region: region))
  } /*else {
    split-locale(locales.get().at("m")) // if current-locale() is not found, then the default locale (m)
  }*/
}

#let get-locale(language, region, default: auto)={
  if type(default) == str or default==auto  { default=split-locale(default) }
  split-locale(compose-locale( if language==auto {default.at("language",default:none)} else {language}, region: if region==auto { if language==auto {default.at("region", default:none)} else {auto} } else {region} ))
}



#let localise(item, locale: auto, final: true)={
//   let not-found=(found:false)
  let is-locale(dict)={
    let is-loc=dict.len()>0
    for key in dict.keys() {
      is-loc=is-loc and (key.len()==2 or (key.len()==5 and key.at(2)==locale-sep))
    }
    is-loc
  }


  let the-locale=split-locale(locale)
  let localised= if type(item)==dictionary {
    if is-locale(item) {
      if the-locale.locale in item {
        localise(item.at(the-locale.locale), locale: the-locale.locale, final: false )
      } else if the-locale.region!=none and the-locale.language in item {
        localise(item.at(the-locale.language), locale: the-locale.locale, final: false)
      } else { (found:false) }
    } else {
      let dict=(:)
      for (key,value) in item {
        value=localise(value, locale: the-locale.locale, final: false)
        if value.found  {dict.insert(key,value.value)}
      }
      (found: true, value: dict)
    }
  } else if type(item)==array {
      (found: true, value: item.map(it=>localise(it, locale: the-locale.locale)) )
  } else {
    (found: true, value: item)
  }
  if final {if localised.found {localised.value} else {none}} else {localised}
}



#let get-prefix-last(terms,n, space: true)={
  let the-term=terms.at("prefix-last")
  if type(the-term)==array {the-term.at(calc.min( calc.max(n - 2, 0), 1))} else {the-term}
  if space [ ]
}

#let capitalise(string)={
 if type(string)==str {upper(string.first())+string.slice(1)} else {string}
}

