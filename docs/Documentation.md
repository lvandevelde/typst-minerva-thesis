# Documentation

**minerva-thesis version 0.2.0**

This documentation explains the functions of the package.
In the code blocks the default values of the named arguments are shown.

## Functions for the main file

The following functions are typically used in the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and back matter (such as a bibliography)).

- `thesis`  
  This function sets the total manuscript.
  
      thesis(
        authors: none,
        title: none,  
        description: none,
        keywords: none,
        language: "EN", 
        faculty: none,
        supervisors: none,
        multiple-supervisors: auto,
        counsellors: none,
        multiple-counsellors: auto,
        date: none,
        font: auto,
        font-size: auto,
        math-font: auto,
        math-font-size: auto,
        figure-font: auto,
        figure-font-size: auto,
        caption-font: auto,
        caption-font-size: auto,
        chapter-title-font: auto,
        chapter-title-font-size: auto,
        chapter-number-font: auto,
        chapter-number-font-size: auto,
        chapter-number-colour: luma(150),
        equation-left-margin: auto,
        paper: none,
        page-width: 160mm, 
        page-height: 240mm,
        page-margin: (y: 15mm, inside: 25mm, outside: 15mm),
        figure-fill: none,
        figure-inset: auto,
        figure-tabular-caption: false,
        figure-bold-ref: auto,
        body,
      )

  - `authors`:  
    Only if `authors` is of type `str` or `array` of `str` elements, this information will be included in the document properties. An `array` with elements not of type `str` is not allowed here.  
    In the [`title-page` function](#title-page-and-logos),  `authors` can be also be of type `content` or `array` of `content` elements.
  - `title` and `description`:  
    The `description` contains typically information on the degree for which the thesis is submitted.
  - `keywords` should be of type `str` or `array`
  - For the `language` and `faculty` arguments the following case-insensitive values (codes) are available. 
      - <a name="language-codes"></a> `language`:
          - `"EN"` for English
          - `"NL"` for Dutch
      - <a name="faculty-codes"></a> `faculty`:
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
  - font settings:
      - `font` and `font-size`: main text font
      - `figure-font` and `figure-font-size`: font used in `figure` elements (tables and figures)
      - `caption-font` and `caption-font-size`: font of figure captions
      - `math-font` and `math-font-size`:  font of equations
      - `chapter-title-font` and `chapter-title-font-size`: font of the title of first-level headings (chapters, parts and non-numbered headings in the front-matter) 
      - `chapter-number-font`, `chapter-number-font-size` and `chapter-number-colour`: font and colour of the number of first-level headings 
      
      For `font` auto means no text font is set, such that the default Typst font is used. For the other fonts, `auto` means no font is set such that the current text font is used.  
      It is recommended to not use many different fonts, e.g., to set the same value for all fonts execept `math-font`.  
      For `font-size`, `auto` means that no font size is set for the main text, such that the default Typst font size is used. For the other font sizes, `auto` means that a pre-defined size relative to `font-size` is used.
      
  - `equation-left-margin`:  
    Sets the left margin of equations.  
    `auto` means centred equations  
  - The arguments `paper`, `page-width`, `page-height` and `page-margin` correspond to the respective arguments `paper`, `width`, `height` and `margin` of the standard `page` element function.  
  `page-width` and `page-height` are ignored when `paper` is given.
  - `figure` settings:
  
    - `figure-fill`: the default background colour of `figure` elements  
      `none` means no fill is applied  
      `auto` means the "tertiary colour" of the Ghent University corporate identity (which is a light blue)
    - `figure-inset`: the default inset of the outer block of `figure` elements if a background colour is given  
      `auto` means 0.5em
    - `figure-tabular-caption`: `bool`  
      If `true`, the caption is set in 2 columns: one for the label (in bold) and one left-aligned column for the caption body
    - `figure-bold-ref`:  `bool` or `auto`  
      If `true`, references to `figure` elements are put in bold. `auto` means the same value as `figure-tabular-caption` is used.

The following functions are used for setting the different parts of a thesis:
  
- `front-matter`

      front-matter(
        show-headings: true,
        body
      )

- `chapter`

      chapter(
        body
      )


- `appendix`

      appendix(
        flyleaf: [Appendices],
        body
      )

    - `flyleaf`:  
        sets the title on the flyleaf before the appendices  
        `none` means no flyleaf

- `back-matter`

      back-matter(
        show-headings: true,
        body
      )

Setting the argument `show-headings` to `false` in `front-matter` or `back-matter` can be used to add pages with a first-level heading to the Table of Contents without showing this heading on the page itself.
  
The functions `thesis`, `front-matter`, `chapter`, `appendix` and `back-matter` are typically used in show rules, such as
    
`#show: thesis.with(...)`
    
You can group the chapters in parts by means of the `part` function:

- `part`
  
      part(
        page-number: false, 
        title
      )
  
  The `part` function creates a flyleaf, indexed in the Table of Contents.  
  If `page-number` is `true` a page number is shown on the part flyleaf.
    
The following auxilliary functions are available:

- The package [`abbr`](https://typst.app/universe/package/abbr) is pre-loaded, such that the functions of this package for handling abbreviations can be used.

- `set-page-number-width` 

      set-page-number-width(pgnum-width)
      
    The positional argument `pgnum-width` is of type `length`. The function sets the available space for the page numbers in the following outlines (Table of Contents, List of Figures, List of Tables).
    The default value of this space is `2em`.

- `hide-page-number`

      hide-page-number()
  
  This function hides the page number on the current page. 
  
- `start-at-odd-page`
  
      start-at-odd-page()
  
  This function inserts a page break and goes to the next odd page. If a blank (even) page is inserted, its page number is hidden. 
  
## Figures and tables


The following functions have been defined with extra features for `figure` elements (figures & tables).

- `m-figure`  
  This function has some extra features compared to the standard `figure` function for:
    - setting an `outline-caption`: a (mostly shorter) caption used in the outline (List of Tables / List of Figures)
    - figures/tables with a coloured background (`fill`)
  When using the `m-figure` function, the (optional) label should be passed as an argument and not be put behind the function call.
  The standard `figure` function can still be used.

- `m-subpar-grid`  
  This function for making figures with subfigures is based on the `subpar.grid` function of package [`subpar`](https://typst.app/universe/package/subpar) but has analogous extra features as `m-figure`.
  Use the standard `figure` function (and not `m-figure`) for the subfigures within `m-subpar-grid`. 
  
Both `m-figure` and `m-subpar-grid` have extra named arguments compared to `figure` and `subpar.grid` respectively:

  - `outline-caption: auto`  
    `auto` means that the caption set by argument `caption` is also used in the outline 
  - `label: none`
  - `breakable: false`  
      If `true`, the figure is able to span multiple pages. This feature is still experimental.
  - `fill: auto`  
     `auto` means the default value set via the `figure-fill` argument of the `thesis` function
  - `inset: auto`  
    `auto` means the default value set via the `figure-inset` argument of the `thesis` function

The standard arguments of `figure` and  `subpar.grid` can be used in `m-figure` and `m-subpargrid` respectively, but the `m-subpar-grid` function has tailored default values for `numbering`, `show-sub`, `numbering-sub` and `numbering-sub-ref`. 

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
        date: auto,
        language: auto,
        faculty: auto,
        description: auto,
        font: auto,
        font-size: auto, 
        title-font-size: auto,
        author-font-size: auto,
        description-font-size: auto,
        supervisor-font-size: auto,
        date-font-size: auto
        ids: none
      )
  
    The arguments from `authors` till `description` can already be set via the `thesis` function. Here, `auto` means that the current values (set by `thesis`) are used.  
    The arguments related to the font and font sizes are analogous to the font related arguments of the `thesis` function.  
    Argument `ids` is a single `str`/`content` or an `array` with ID(s) such as ISBN, NIR code, etc. 


- `ugent-logo`

      ugent-logo(
        language: "EN"
      ) 
      
  This function creates an `image` with the Ghent University logo.
  
- `faculty-logo`

      faculty-logo(
        language: "EN",
        faculty: none`
      )

  This function creates an `image` with the logo of a Ghent University faculty, see the [language](#language-codes) and [faculty codes](#faculty-codes) above.

## Functions for an (extended) abstract

An extended abstract, i.e. an abstract in double-column format and with a separate bibliography, can be included by using the following function:

- `extended-abstract`

      extended-abstract(
        authors: auto,
        title: auto,
        supervisors: auto,
        multiple-supervisors: auto,
        counsellors: auto,
        multiple-counsellors: auto,
        font: auto,
        font-size: 10pt,
        math-font: auto,
        math-font-size: auto,
        figure-font: auto,
        figure-font-size: auto,
        caption-font: auto,
        caption-font-size: auto,
        title-font: auto,
        title-font-size: auto,
        author-font: auto,
        author-font-size: auto,
        equation-left-margin: auto,
        bibliography: none,
        read: none,
        body
      )
      
    Most arguments can already be set via the `thesis` function.  
    `auto` means that the current values (set by `thesis`) are used.  
    The additional font related arguments are analogous to the font related arguments of the `thesis` function.
    
    A separate bibliography can be added by means of the following arguments:
    - `bibliography`: relative path to the bibliography file
    - `read` has to be set to `"(path) => read(path)"`
      
    For referring to this bibliography in the extended abstract, the prefix `"eab-"` (meaning "extended abstract bibliography") has to be added to the label. E.g., a citation to the publication with label `"pub1"` in the bibliography file is given by `@eab-pub1`.


For both a regular (single-page) abstract and the extended abstract, the following function can be used for setting the abstract and keywords:

- `abstract-keywords`
    
      abstract-keywords(
        keywords: auto,
        body
      )

  For the `keywords` argument, `auto` means that the keywords set via the `thesis` function are used.  
  Set `body` or `keywords` to `none` for omitting the abstract or keywords respectively.


An example of a thesis with both a regular abstract and an extended abstract can be found in `examples/Masters-thesis`.


