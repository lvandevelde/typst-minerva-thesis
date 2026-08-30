# Documentation

**minerva-thesis version 0.3.0 (in progress)**

This documentation explains the functions of the package.
In the code blocks the default values of the named arguments are shown.

## Overview

+ [Functions for the main file](#functions-for-the-main-file)
+ [Figures and tables](#figures-and-tables)
+ [Title page and logos](#title-page-and-logos)
+ [Functions for an (extended) abstract](#functions-for-an-extended-abstract)
+ [Miscellaneous functions](#miscellaneous-functions)
+ [Pre-defined variables](#predefined-variables)


## Functions and variables for the main file

The functions described in this section are typically used in the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and back matter (such as a bibliography)).

### Main functions

- <a name="thesis"></a> `thesis`  
  This function sets the total manuscript.
  
      thesis(
        authors: none,
        title: none,
        description: none,
        keywords: none,
        language: "en",
        region: auto,
        faculty: none,
        supervisors: none,
        multiple-supervisors: auto,
        counsellors: none,
        multiple-counsellors: auto,
        date: none,
        terminology: (:),
        paper: none,
        page-width: 160mm, 
        page-height: 240mm,
        page-margin: auto,
        font: auto,
        font-size: 11pt,
        math-font: auto,
        math-font-size: auto,
        header-heading-levels: (even: 1, odd: 2),
        header-text: none,
        header-prefix-text: none,
        header-separator: [ -- ],
        part-numbering: "I",
        part-number-text: auto,
        part-title-text: auto,
        chapter-numbering: "1.1",
        chapter-title-text: auto,
        chapter-show: auto,
        chapter-number-text: auto,
        chapter-number-align: right,
        chapter-title-align: right,
        appendix-numbering: "A.1",        
        equation-numbering: "(1)",
        figure-numbering: "1",        
        per-chapter-numbering: true,
        equation-left-margin: auto,
        figure-kinds: (:),
        figure-fill: none,
        figure-inset: 0.5em, 
        figure-text: auto, 
        caption-text: none,
        caption-text-align: "indent",
        caption-align: center,
        caption-separator: sym.colon+sym.space,
        caption-num-text: (weight: "semibold"),
        subfigure-numbering: "a",
        subfigure-ref-numbering: auto,
        subfigure-caption-text: auto,
        subfigure-caption-pos: top,
        subfigure-caption-align: left,
        subfigure-caption-sep: auto,
        subfigure-caption-text: auto,
        subfigure-caption-prefix-text: auto,
        figure-ref-text: (:),
        body,
      )

  - `authors`:  
    Only if `authors` is of type `str` or `array` of `str` elements, this information will be included in the document properties. An `array` with elements not of type `str` is not allowed here.  
    In the [`title-page` function](#title-page-and-logos),  `authors` can be also be of type `content` or `array` of `content` elements.
  - `title` and `description`:  
    The `description` contains typically information on the degree for which the thesis is submitted.
  - `keywords` should be of type `str` or `array`
  - `language`: two-character `str` of the language
  - `region`:  two-character `str` of the region  
    `auto` means `"GB"` if language is `"en"` and `"BE"` if `"nl"`.  
    The locale used is composed of the language and the region, e.g. `"en-GB"` or `"nl-BE"`.
    
  - <a name="faculty-codes"></a> The faculty code (only relevant for Ghent University theses) can have one of the following (case-insensitive) values:
  
      - `"LW"`: Arts and Philosophy
      - `"RE"`: Law and Criminology
      - `"WE"`: Sciences
      - `"GE"`: Medicine and Health Sciences
      - `"EA"`: Engineering and Architecture
      - `"EB"`: Economics and Business Administration
      - `"DI"`: Veterinary Medicine
      - `"PP"`: Psychology and Educational Sciences
      - `"BW"`: Bioscience Engineering
      - `"FW"`: Pharmaceutical Sciences
      - `"PS"`: Political and Social Sciences
        
  - `supervisors`, `counsellors`:  `str`, `content` or `array` with names (and affiliations) of supervisors(s) and counsellor(s)  
  -  `multiple-supervisors` and `multiple-counsellors`: `bool` or `auto`   
     `multiple-supervisors` and `multiple-counsellors` can be set to `true` or `false` to indicate whether there are multiple supervisors or counsellors.  
    The value `auto` means `true` if `supervisors`/`counsellors`is an `array` with more than one element and `false` otherwise.
  - `date`:  
    If `date` is of type `datetime`, it is added to the document properties.
  - `terminology`:  
    Dictionary with localised terms for parts, chapters, etc. and localised titles  
    `auto` means the default terminology is used, which is defined by `default-terminology` (see `lib/settings.typ`), but only for English (en) and Dutch (nl).  
    The possible keys of the dictionary are the following (while other keys are ignored):
      - `part`: supplement for parts
      - `chapter`: supplement for chapters
      - `appendix`: supplement for appendices 
      - `section`: supplement for other sections (any other `heading`)
      - `figure-image`<sup>*</sup>: supplement and outline title for figures of kind `image` ("figures") 
      - `figure-table`<sup>*</sup>: supplement and outline title for figures of kind `table` ("tables")
      - `figure-raw`<sup>*</sup>: supplement and outline title for figures of kind `raw` ("listings")
      - `math-equation`<sup>*</sup>: supplement and outline title for equations (`math.equation`)
      - `table-of-contents`<sup>*</sup>: title of the table of contents (made by inserting `table-of-contents`)
      - `list-of-abbreviations`: title  of the list of abbreviations (made by inserting `list-of-abbreviations`)
      - `bibliography`<sup>*</sup>: title for the bibliography 
      - `references`: title of the references section in the extended abstract
      - `supervisor`: term for "supervisor(s)" of the thesis (singular and plural forms)
      - `counsellor`: term for "counsellors()"/"tutors()" (singular and plural forms)
      - `abstract`: term for "abstract" (including an em dash, possibly surrounded by spaces, e.g. the predefined values are (in Dutch an em dash is separated by spaces):
      
                abstract: (
                  en: [Abstract---], 
                  nl: [Samenvatting --- ])
        
      - `extended-abstract`: term for "extended abstract"
      - `keywords`: term for "keywords", including the em dash, analogously to `abstract`
      - `title-page`: bookmark for the title page (If `none`, the title page is not bookmarked. In any case the title page is not outlined.)
      - `prefix-last`: prefix for the last item in a list. It can be an array of two items for making a distinction between lists with two elements or with three or more elements. E.g., the default values for English and Dutch (see `lib/settings.typ`) are:
      
            prefix-last: (
              en: (
                " and",
                ", and"
              ),
              nl: " en"
            )
      
    The values in the dictionary can be dictionaries themselves with values for different locales. E.g., the title of the bibliography can be set by adding the following key/value pair to the `terminology` argument:

        bibliography: (
          en: "References",
          nl: "Referenties"
        )

    The values for the locale set by `language` and `region` will be automatically selected. E.g. if the locale is `en-GB` the values with key `en-GB` will be used. If this key is not present, the value with key `en` will be used.
    
    For the supplements, singular and plural forms can be given as an array, e.g.:
    
        chapter: ("Hoofdstuk", "Hoofdstukken")
    
    If only one value is given, this will be used for the singular form. The plural form will then be the singular form with a "s" at the end (only useful in some languages).   
    For keys corresponding to standard elements (indicated with <sup>*</sup> in the list above), a value `auto` (e.g. for the singular form of the supplement) means that the default Typst value is used.  
    When `math-equation` (i.e. the supplement for equations) is set to `none`, references to equations consist of the equation number between parentheses.  

    
  - The arguments `paper`, `page-width`, `page-height` and `page-margin` correspond to the respective arguments `paper`, `width`, `height` and `margin` of the standard `page` element function.  
    `page-width` and `page-height` are ignored when `paper` is given.
  - font settings for main text and equations:
      - `font` and `font-size`: main text font
      - `math-font` and `math-font-size`:  font of equations
      
      For `font`, `auto` means no text font is set, such that the default Typst font is used. For the other fonts `auto` means no font is set such that the current or default text font is used.  
      It is recommended to not use many different fonts, e.g., to set the same value for all fonts except `math-font`.  
      For `font-size` and `math-font-size`, `auto` means that no font size is set for the main text or equations respectively, such that the default font size is used. 
  - Page `header` settings (for headers showing the heading of the current chapter/appendix or section):
    - `header-heading-levels`: level or dictionary of levels of the headings shown in the page header.  
      The dictionary should have two keys: `even` and `odd`, with the levels of the headings to be shown on even and odd pages. A single value (instead of a dictionary) sets the level for both even and odd pages.  
      `none` means that no header will be shown.
      E.g. `(even: 1, odd: 2)`: On even pages the chapter title is shown in the header and on odd pages the section title. 
    - `header-text` and `header-prefix-text`: [text-settings](#text-settings) for the total header and the prefix (supplement and number) respectively
    - `header-separator`: separator between the prefix and the title
          
  - `part-numbering`, `part-number-text`,  `part-title-text`: 
    numbering format and [text settings](#text-settings) of the part number and title on the part flyleaf  
    Only relevant if the thesis is divided in [parts](#parts).
  - `chapter-numbering`, `chapter-title-text`, `chapter-show`, `chapter-number-text`, `chapter-number-align`, `chapter-title-align`: heading numbering in chapters and settings for the layout of chapter headings  
    `chapter-show` determines if the term for chapter is added to the chapter number in the chapter heading, the table of contents and the page header (when first-level headings are shown in the header). When `auto`, the term for chapter is only added if the thesis is divided into [parts](#parts).  
    The alignment of the number and title in the chapter heading is also applied in part and appendix headings.
  - `appendix-numbering`: heading numbering in appendices  
    Other settings are equal to these of chapters.
  - `equation-numbering`, `figure-numbering`, `per-chapter-numbering`: numbering of equations and figures  
    The pattern for equation numbering usually contains parentheses.  
    The `figure-numbering` may be a dictionary for setting values for one or more specific kinds of figures, see [figure-settings](#figure-settings).  
    <a name="per-chapter-numbering"></a>If `per-chapter-numbering` is set `true`, `auto` or a string (`str`), equations and figures are numbered per chapter/appendix.  The figure number (withing a chapter/appendix) is preceeded by the chapter/appendix number and a separator. If `per-chapter-numbering` is a string, this will be used as separator, otherwise the default separator (`"."`) is used.
    The combined number is then determined by  `chapter-numbering`/`appendix-numbering`, the separator and `equation-numbering`/`figure-numbering`.  
    For equations the prefix and suffix (usually parentheses) of the `equation-numbering` pattern will be applied.  
    If `per-chapter-numbering` is set `false` or `none`, equations and figures are numbered continuously over the whole thesis (except the possible extended abstract(s)).
  - `equation-left-margin`:  
    Sets the left margin of equations.  
    `auto` means centred equations.

  - <a name="figure-kinds"></a>`figure-kinds`:  `dictionary` 
    Definition of kinds of figures, additional to the standard kinds, i.e. the functions `image` ("figure"), `table` ("table") and `raw` ("listing").
    The user-defined kinds are of type `str` and their definition is given by the dictionary `figure-kinds`, the keys of which are the newly defined kinds.  
    The format of this dictionary is:
    
          (
            <kind-1>: (
              supplement: (<singular-1>,<plural-1>),
              outline-title: <title-1>
            ),
            <kind-2>: (...),  
          )
    
    Analogous to `terminology` the `figure-kinds` can be set for different locales by replacing the values by dictionaries of values, e.g.
    
          figure-kinds: (
            theorem: (
              supplement: (
                en: ("Theorem", "Theorems"), 
                nl: ("Stelling", "Stellingen") 
              ),
              outline-title: (
                en: "List of Theorems", 
                nl: "Lijst van stellingen"
              )
            )
          ),

    This way theorems can be set via an [`m-figure`](#m-figure) (or standard `figure`):
        
        m-figure(kind: "theorem", caption: [...], ...)
          
    and an outline of the theorems can be made by using [`list-of-figure-kind`](#list-of-figure-kind):
    
        list-of-figure-kind("theorem")
          
    Note that kind `"theorem"` is a string (`str`) and not a function. 
    
  - <a name="figure-settings"></a>`figure` settings:  
    - `figure-fill`: the default background colour of `figure` elements  
      `none` means no fill is applied  
      `auto` means `default-figure-fill` (which is light gray).
    - `figure-inset`: the default inset of the outer block of `figure` elements if a background colour (`figure-fill`) is given  
    - `figure-text`: [`text` settings](#text settings) for `figure` elements   
      `auto` means the font set via the `font` argument is used and the size given by `font-size` multiplied by `default-figure-font-size` (=90%).
    - `caption-align`: alignment of the caption (within the figure)
    - `caption-text-align`: alignment of the caption text: an alignment (e.g. `left` or `center`) or `"indent"`. In case of the latter, the caption will be set with a hanging indent.  
    - `caption-separator`: separator between the figure number and the caption body
    - `caption-text:` [`text` settings](#text-settings) for `figure` captions  
    `none` means the text settings of `figure-text` are used.
    - `caption-prefix-text`: [`text` settings](#text-settings) for the supplement and number in the caption
    - `figure-ref-text`: [`text` settings](#text-settings) for references (`ref`) to figures.
    
    
    The figure settings can be set for all (standard and [user-defined](#figure-kinds)) kinds of figures at once or for specific kinds. In the latter case, `rest` can be used for selecting all non-mentioned kinds.
    E.g.
    
        caption-text: ( smallcaps, (font: "Arial") ),
        figure-ref-text: (weight: "semibold")

    sets captions in `smallcaps` and font Arial, and references to figures in `"semibold"` for all kinds,  while
    
        caption-text: (table: smallcaps, theorem: (style: "italic"), rest: (font: "Arial") )
    
    sets table captions in `smallcaps`, theorem captions italic and all other captions in font Arial.

  - Settings of subfigures (made by means of [`m-subpar-super`](#m-subpar-super) or [`m-subpar-grid`](#m-subpar-grid):
    - `subfigure-numbering`: numbering of the subfigure
    - `subfigure-ref-numbering`: numbering of the subfigure in references; `auto` means the same value as `subfigure-numbering`  
      In references to subfigures, the figure number and the subfigure number are joined. By means of `subfigure-ref-numbering` the pattern of the subfigure number in this combined number can be controlled. E.g. when `subfigure-numbering` is `"a"` and  `subfigure-ref-numbering` is `".a"`, the subfigures are numbered `a`, `b`, `c` etc. in the figure and in references to the subfigures, the figure and subfigure numbers will be joined with a dot (`.`) in between.
    - `subfigure-caption-text`: [`text` settings](#text-settings) of the captions  
    - `subfigure-caption-pos`: position of the caption (`top` or `bottom`)
      For figures of kind `table` the caption position is always `top`. 
    - `subfigure-caption-align`: alignment of the caption with respect to the whole subfigure
    - `subfigure-caption-sep`: separator of the caption; `auto` means the value set via `caption-separator`.
    - `subfigure-caption-text` and `subfigure-caption-prefix-text`: analogous to `caption-text` and `caption-prefix-text`.


  - <a name="text-settings"></a> Settings for `text` can be given in the form of:
      - a dictionary with arguments passed to the `text` function (e.g. by means of a set-rule)  
        e.g. `(weight: "semibold", size: 9pt, font: "Arial")` 
      - a function used as a show rule for `text`  
        e.g. `smallcaps` 
      - an array of a dictionary and function(s)  
        e.g. `(smallcaps, (size: 9pt, font: "Arial") )`
            
      
- The following functions are used for setting the different parts of a thesis:
  
  - <a name="front-matter"></a> `front-matter` 

        front-matter(
          show-headings: true,
          show-headers: false,
          body
        )

  - `chapter`

        chapter(
          show-headers: true,
          body
        )

  - `appendix`

        appendix(
          flyleaf: auto,
          show-headers: true,
          body
        )

    - `flyleaf`:  
        sets the title on the flyleaf before the appendices  
        `auto` means the localised term for appendix/appendices (settable via the `terminology` argument of `thesis`).  
        `none` or `false` means no flyleaf.

  - `back-matter`

        back-matter(
          show-headings: true,
          show-headers: true,
          body
        )

  Setting the argument `show-headings` to `false` in `front-matter` or `back-matter` can be used to add pages with a first-level heading to the Table of Contents without showing this heading on the page itself.  
  The argument `show-headers` determines whether page headers are shown.
  
The functions `thesis`, `front-matter`, `chapter`, `appendix` and `back-matter` are typically used in show rules, such as
    
`#show: thesis.with(...)`

### Parts

<a name="parts"></a> You can group the chapters in parts by means of the `part` function:
  
      part(
        page-number: false, 
        title
      )
  
  The `part` function creates a flyleaf, indexed in the Table of Contents.  
  If `page-number` is `true` a page number is shown on the part flyleaf.
  
### Outlines
  
Outlines can be made by means of the following variables/functions:

- Table of contents: `table-of-contents`
- List of abbreviations:  `list-of-abbreviations`
- List of equations: `list-of-equations` 
- <a name="list-of-figure-kind"></a>List of figures of a specific kind: `list-of-figure-kind`

      list-of-figure-kind(kind)
    
  `kind` is a `str` in case of kinds defined via the [`figure-kinds`](#figure-kinds) argument of the `thesis` function and a function (`image`, `table` or `raw`) otherwise. For the latter, the following convenience variables have been defined:
  
      list-of-figures = list-of-figure-kind(image)
      list-of-tables = list-of-figure-kind(table)
      list-of-listings = list-of-figure-kind(raw)

The space for setting the page numbers in outlines can be tuned by means of the `set-page-number-width` function: 

      set-page-number-width(pgnum-width)
      
  The positional argument `pgnum-width` is of type `length`. The function sets the available space for the page numbers in the following outlines (Table of Contents, List of Figures, List of Tables).
  The default value of this space is `2em`.
      

## Figures


The following functions have been defined with extra features for `figure` elements (of different kinds: `image`, `table`, `raw` or [user-defined kinds](#figure-kinds)).

- <a name="m-figure"></a>`m-figure`  
  This function has some extra features compared to the standard `figure` function for:
    - setting an `outline-caption`: a (mostly shorter) caption used in the outline (List of Tables / List of Figures)
    - figures/tables with a coloured background (`fill`)
  When using the `m-figure` function, the (optional) label should be passed as an argument and not be put behind the function call.  
  The standard `figure` function can still be used.

- <a name="m-subpar-super"></a>`m-subpar-super` and <a name="m-subpar-grid"></a>`m-subpar-grid`  
  These functions for making figures with subfigures are based on the `subpar.grid` function of package [`subpar`](https://typst.app/universe/package/subpar) but have analogous extra features as `m-figure`.
  Use the standard `figure` function (and not `m-figure`) for the subfigures within `m-subpar-super` and `m-subpar-grid`. 

The default value of the named argument `outlined` of `m-figure`, `m-subpar-super` and `m-subpar-grid` is `auto`, which means that the current set value of `outlined` for the function `figure` is used.
  
The functions `m-figure`, `m-subpar-super` and `m-subpar-grid` have extra named arguments compared to `figure`, `subpar.super` and `subpar.grid` respectively:

  - `outline-caption: auto`  
    `auto` means that the caption set by argument `caption` is also used in the outline 
  - `label: none`
  - `breakable: false`  
      If `true`, the figure is able to span multiple pages. This feature is still experimental.
  - `fill: auto`  
     `auto` means the default value set via the `figure-fill` argument of the `thesis` function
  - `inset: auto`  
    `auto` means the default value set via the `figure-inset` argument of the `thesis` function

The functions `m-subpar-super` and `m-subpar-grid` have some additional arguments for setting the subfigures: `subfigure-caption-font`, `subfigure-caption-font-size`, `subfigure-caption-pos`, `subfigure-caption-align`, `subfigure-caption-sep`, `subfigure-numbering`, `subfigure-num-textargs`, which allow to override the settings set via [`thesis`](#thesis) or [`extended-abstract`](#extended-abstract).
    
The standard arguments of `figure`, `subpar.super` and `subpar.grid` can be used in `m-figure`, `m-subpar-super` and `m-subpar-grid` respectively, but the `m-subpar-super` and `m-subpar-grid` functions have tailored default values for `numbering`, `show-sub`, `numbering-sub` and `numbering-sub-ref`.

## Title page and logos

For creating the title page and the use of Ghent University logos the following functions are available.

- `title-page`

  The function `title-page` can (for the time being) only be used for Ghent University theses. Otherwise the title page has to be built manually.
  
      title-page(
        authors: auto,
        title: auto,
        supervisors: auto,
        multiple-supervisors: auto,
        counsellors: auto,
        multiple-counsellors: auto,
        description: auto,
        date: auto,
        faculty: auto,
        language: auto,
        region: auto,
        terminology: auto,
        additional-logo: none,
        ids: none,
        font: auto,
        font-size: auto, 
        title-font-size: auto,
        author-font-size: auto,
        description-font-size: auto,
        supervisor-font-size: auto,
        date-font-size: auto,
      )

    The arguments from `authors` till `terminology` can already be set via the `thesis` function. Here, `auto` means that the current values (set by `thesis`) are used.  
    The arguments related to the font and font sizes are analogous to the font related arguments of the `thesis` function.  
    Argument `additional-logo` can be used to add one or more additional logos, besides the Ghent University logo. This argument has to be a `dictionary` or an array of `dictionary` where each `dictionary` has two fields (key/value pairs): 
      - `image`: the `image` of the logo, made by means of the `image` function without setting `height` or `width` (i.e. by leaving them `auto`)
      - `height`: the height of the logo on the title page, relative to the height of the Ghent University logo (e.g., `80%`)
    Argument `ids` is a single `str`/`content` or an `array` with ID(s) such as ISBN, NIR code, etc. 


- `ugent-logo`

      ugent-logo(
        language: auto,
        ..args
      ) 
      
  This function creates an `image` with the Ghent University logo in English (en) or Dutch (nl).  
  `language` has to be set to `"en"` or `"nl"` (case-insensitive) or to `auto`. The latter means that the language set via the `thesis` function is used, which is only relevant if that language is English or Dutch.  
  The arguments `..args` are passed to the `image` function.
  
- `faculty-icon`

      faculty-icon(
        faculty,
        language: auto,
        ..args
      )

  This function creates an `image` with the icon of a Ghent University faculty, see [faculty codes](#faculty-codes), English or Dutch. The `language` argument has the same meaning as for the `ugent-logo` function. The arguments `..args` are passed to the `image` function.

## Functions for an (extended) abstract

An extended abstract, i.e. an abstract in double-column format and with a separate bibliography, can be included by using the following function:

- <a name="extended-abstract"></a> `extended-abstract`

      extended-abstract(
        authors: auto,
        title: auto,
        supervisors: auto,
        multiple-supervisors: auto,
        counsellors: auto,
        multiple-counsellors: auto,
        language: auto,
        region: auto,
        keywords: auto,
        terminology: (math-equation: (supplement: none)),
        flyleaf: auto,
        font: auto,
        font-size: 10pt,
        math-font: auto,
        math-font-size: auto,
        equation-numbering: "(1)",
        equation-left-margin: auto,
        title-text: auto,
        author-text: auto,
        figure-kinds: (:),
        figure-numbering: (table: "I"),
        figure-fill: none,
        figure-inset: auto,
        figure-text: auto,
        caption-position: auto,
        caption-align: auto,
        caption-text-align: left,
        caption-separator: auto,
        caption-text: auto,
        caption-prefix-text: none,
        subfigure-caption-position: auto,
        subfigure-caption-align: auto,
        subfigure-caption-text-align: auto,
        subfigure-caption-sep: auto,
        subfigure-numbering: auto,
        subfigure-ref-numbering: auto,
        subfigure-caption-text: auto,
        subfigure-caption-prefix-text: auto,
        figure-ref-text: none,
        label: none,
        body
      )

    Most arguments can already be set via the `thesis` function.  
    For most arguments, `auto` means that the value set via the `thesis` function is used.  
    The locale can be changed with respect to the main document by means of the `language` and `region` arguments.  
    The arguments `title-text` and `author-text` are the [`text` settings](#text-settings) of the title and the rest of the heading respectively. `auto` means some predefined settings.
     
    Some values for the figure related arguments have been predefined:  `default-figure-fill`, `default-figure-inset`, `default-figure-font-size`, `default-figure-numbering`,  `default-caption-position`,  `default-caption-separator`,  `default-subfigure-numbering`, `default-subfigure-ref-numbering`,  `default-caption-prefix-text`, e.g., for resetting non-default arguments set via the `thesis` function to their default value.  
    If `keywords` is not `auto` the keywords set via the `thesis` function are overwritten (for the rest of the thesis, not only for the current abstract).  
    The additional font related arguments are analogous to the font related arguments of the `thesis` function.
    
    An extended abstract inherits the `terminology` and the `figure-kinds` set via `thesis()`, possibly for different locales, and new values can be added via the `terminology` and the `figure-kinds` arguments of `extended-abstract`. If the locale of an extended abstract is different from the main text, the `terminology` and `figure-kinds` for the abstract's locale can thus already be given via `thesis()`.  
    The `flyleaf` argument (of type `bool` (boolean) or `auto`) sets whether the extended abstract is preceeded by a flyleaf. `auto` means a flyleaf is shown if it appears in a environment where `show-headings` is switched on, e.g. in [`front-matter`](#front-matter) where `show-headings` is `true`.  
    
    The `label` argument (of type `label` or `none`) sets the label attached to the title of the extended abstract.   


For both a regular (single-page) abstract and the extended abstract, the following function can be used for setting the abstract and keywords:

- `abstract-keywords`
    
      abstract-keywords(
        keywords: auto,
        language: auto,
        region: auto,
        body
      )

  For the `keywords`, `language` and `region` arguments, `auto` means that the values set via the `thesis` or `extended-abstract` function are used.  
  
  Set `body` or `keywords` to `none` for omitting the abstract or keywords respectively.


An example of a thesis with both a regular abstract and an extended abstract can be found in `examples/Masters-thesis`.

## Changing the locale

The locale (language and region) can be changed via the `change-locale` function:

- `change-locale` 

      change-locale(
          language: auto,
          region: auto,
          terminology: (:),
          figure-set: auto,
          equation-set: auto,
          per-chapter-numbering: false,
          body
      )

    The `language` and (optionally) the `region` determine the locale used in `body`.  
    The given terminology is merged with the terminology set by the `thesis` function for the chosen locale.  
    Figure and equation settings can be set via `figure-set` and `equation-set`. `auto` means that the current settings (inherited from `thesis`) are used. In order to use different settings, `figure-set` and/or `equation-set` should be dictionaries with the various settings.
    
    The `figure-set` dictionary may have the following keys: `figure-kinds`, `figure-text`, `figure-fill`, `figure-inset`, `figure-numbering`, `caption-position`, `caption-align`, `caption-text-align`, `caption-separator`, `caption-text`,  `subfigure-caption-position`, `subfigure-caption-align`, `subfigure-caption-text-align`, `subfigure-caption-sep`, `subfigure-numbering`, `subfigure-ref-numbering`, `subfigure-caption-text`, `subfigure-caption-prefix-text`, and `figure-ref-text`.  
    The `equation-set` dictionary may have the following keys: `math-font`, `math-font-size`, `equation-numbering`, and `equation-left-margin`.  
    The values of these keys and the `per-chapter-numbering` argument have the same meaning as the corresponding arguments of the `thesis` function.
    
    
- Example: a show rule setting the language to Dutch till the end of the scope (e.g. the end of the file):

      #show: change-locale.with(language:"nl")
      
      = Dankwoord
      
      Een dankwoord in het Nederlands...

## Miscellaneous functions  
      
- Headers

  The titles of the headings shown in the page header can be modified by means of the `set-header-title` function:

      set-header-title(
        title
      )
  
  By using this function an alternative title will be shown in the header. E.g., if a header shows the first-level heading (chapter title), an alternative title can be given by applying `set-header-title` before the first-level heading: 
    
      #set-header-title[Introduction]
    
      = Introduction to the Subject of the Thesis

  In this case, the shorter title "Introduction" will be used in the header instead of the real chapter title "Introduction to the ...". 

- References to a list of elements:

  - `ref-list()`: Reference to a list of elements (of the same kind)  
  
        ref-list(
          ..args, 
          supplement: auto, 
          )

     `..args` is a series of labels and/or pairs of labels (arrays) of elements (of the same kind). A pair of labels refers to a range of elements and the references to the first and the last element are joined with a hyphen. If more than 2 labels are given in an array, only the first and the last ones are considered.  
     The supplement (plural form) is predefined for standard elements (in English and Dutch) and can be changed or added (for other locales) via the `terminology` argument of `thesis` or `extended-abstract`. For user-defined kinds of figures, the supplements (singular and plural) are defined via the [`figure-kinds`](#figure-kinds) argument.  If needed another supplement can be provided to the `ref-list` function. 
     
     E.g., when `<fig1-1>`, `<fig1-4>`, `<fig1-7>`, `<fig1-9>` are the labels of figures 1.1, 1.4, 1.7 and 1.9(`figure` of kind `image`),
     
        ref-list( <fig1-1>, (<fig1-4>, <fig1-7>), <fig1-9> )

    will produce a reference in the form of "Figures 1.1, 1.4-1.7, and 1.9". 
  
  - `ref-range()`: Reference to a range of elements
  
        ref-range(
          ..labels,
          supplement: auto)

     Here two labels have to be given, producing a reference in the form "Figures 1.1-1.7". If more than two labels are given, only the first and the last one are used for determining the range.  
     `ref-range` is a convenience function which calls `ref-list()`, e.g. `ref-range(<fig-1>,<fig-4>)` is equal to `ref-list((<fig-1>,<fig-4>))`
  
          
- The package [`abbr`](https://typst.app/universe/package/abbr) is pre-loaded, such that the functions of this package for handling abbreviations can be used.



- `hide-page-number`

      hide-page-number
  
  This variable hides the page number on the current page. 
  
- `start-at-odd-page`
  
      start-at-odd-page(weak: true)
  
  This function inserts a page break to the next odd page and suppresses page numbering and headers on possibly inserted empty pages.  
  If `weak` is `true` (= the default), no page will be inserted if the current page is blank.
  
- `double-blank-page` 
  
      double-blank-page
      
  This variable inserts a double blank page (using `start-at-odd-page` and `hide-page-number`).

## Pre-defined variables

  Some predefined variables are available to the user, amongst others:
  
  + colours of Ghent University corporate identity:
      
      + `colour-primary`: `rgb("#1e64c8")`
      + `colour-secondary`: `rgb("#ffd200")`
      + `colour-tertiary`: `rgb("#e9f0fa")`


  + figure and equation related variables:
        
      + `light-gray`: `luma(245)`
      + `default-numbering`: `"1"` (which corresponds to `"(1)"` for equations)
      + `default-separator`: `"."` (separator between chapter/appendix number and figure/equation number in case of [per-chapter-numbering](#per-chapter-numbering))
      + `default-figure-fill`: `light-gray` 
      + `default-figure-inset`: `0.5em` 
      + `default-figure-font-size`: `90%`
      + `default-caption-separator`: `sym.colon+sym.space` (`": "`)
      + `default-subfigure-numbering`: `"a"`
      + `default-caption-num-textargs`: `(weight: "semibold")`
  
  The full list of predefined variables can be found in `lib/settings.typ`.
