# Documentation

**minerva-thesis version 0.1.3**

This documentation explains the functions of the package.

Below, for every function the named arguments and their default values are listed.

## Functions for the main file

The following functions are typically used in the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and back matter (such as a bibliography)).


- `thesis`  
  This function sets the total manuscript.

  - `font: "Libertinus Sans"`
  - `fontsize: 10pt`
  - `mathfont: "Libertinus Math"`
  - `mathfontsize: 10pt`
  - `figurefont: "Libertinus Sans"`
  - `figurefontsize: 10pt`
  - `captionfont: "Libertinus Sans"`
  - `captionfontsize: 10pt`
  - `equation-left-margin: auto`  
    Sets the left margin of equations.  
    `auto` means centred equations  
  - `figure-fill: none`  
      the default background colour of figures and tables  
      `auto` means the "tertiary colour" of the Ghent University corporate identity (which is a light blue)
  - `figure-inset: auto`  
      the default inset of the outer block of figures if a background colour is given  
      `auto` means 0.5em
  - `paper: none`  
  - `page-width: 160mm`  
    Is ignored when `paper` is given
  - `page-height: 240mm`  
    Is ignored when `paper` is given

The optional arguments `paper`, `page-width` and  `page-height` correspond to the respective arguments `paper`, `width` and  `height`
    of the standard `page` element function.
    
The following functions are used for setting the different parts of a thesis:
  
- `frontmatter`
  - `showheading: true`
- `chapter`
- `appendix`
  - `flyleaf: [Appendices]`  
  sets the title on the flyleaf before the appendices  
  `none` means no flyleaf
- `backmatter`
  - `showheading: true`

Setting the argument `showheading` to `false` in `frontmatter` or `backmatter` can be used to add pages with a first-level heading to the Table of Contents without showing the heading on the page itself.
  
The functions `thesis`, `frontmatter`, `chapter`, `appendix` and `backmatter` are usually used in show rules, such as
    
`#show: thesis.with(...)`
    
You can group the chapters in parts by means of the `part` function:

- `part`
  - `pagenumber: false`  
  If `true` a page number is shown on the part flyleaf.
  
  The `part` function creates a flyleaf, indexed in the Table of Contents, and has one positional argument, viz the title of the part.
    
The following auxilliary functions are available:

- `hidepagenumber`  
  - `outline: true`
  Hide the page number on the current page. If `outline`is `true`, the page number is also omitted in the Table of Contents entry of the page, if present.
- `startatoddpage`  
  Insert a page break and go to the next odd page. If a blank (even) page is inserted, its page number is omitted. 
  
## Figures and tables


The following functions have been defined with extra features for figures & tables.

- `myfigure`  
  This function has some extra features compared to the standard `figure` function for:
    - setting an `outline-caption`: a (mostly shorter) caption used in the outline (List of Tables / List of Figures)
    - figures/tables with a coloured background (fill)
  When using the `myfigure` function, the (optional) label should be passed as an argument and not be put behind the function call.
  The standard `figure` function can still be used, of course.

- `mysubpargrid` 
  This function for making figures with subfigures is based on the function `subpar.grid` (of package [subpar](https://typst.app/universe/package/subpar)) but with analogue extra features as `myfigure`.
  Use the standard `figure` function for the subfigures within mysubpargrid(). 
  
Both `myfigure` and `mysubpargrid` have extra named arguments compared to `figure` and `subpar.grid` respectively:

  - `outline-caption: auto`  
    `auto` means that the caption set by argument `caption` is also used in the outline 
  - `label: none`
  - `breakable: false`  
      If `true`, the figure is able to span multiple pages. This feature is still experimental.
  - `fill: auto`  
     `auto` means the default value set via the function `thesis`
  - `inset: auto`  
    `auto` means the default value set via the function `thesis`

The standard arguments of `figure` and  `subpar.grid` can be used in `myfigure` and `mysubpargrid` respectively. 

## Title page and logos

For creating the title page and the use of Ghent University logos the following functions are available.

- `titlepage`

  The function `titlepage` can (for now) be used for Ghent University theses only. Otherwise the title page has to be built manually.

  - `title: none`
  - `author: none`
  - `supervisors: none`  
      use in case of multiple supervisors
  - `supervisor: none`  
      use in case of a single supervisor 
  - `counsellors: none`  
      use in case of multiple counsellors
  - `counselor: none`  
      use in case of a single counsellor
  - `date: none`
  - `language: "EN"`  
  - `faculty: none`  
  - `description: none`  
      Typically information on the degree for which the thesis is submitted.
  - `ids`: `none`  
    ID(s) such as ISBN, NIR code, ... : single string/content or array
  - `font: auto`  
    `auto` means the current font (usually, `font` set via `thesis`) 
  - `fontsize: auto`  
    base font size  
    `auto` means the current font size (usually, `fontsize` set via the `thesis` function) 

- `ugentlogo`

    - `language: "EN"`
  
- `facultylogo`

    - `language: "EN"`
    - `faculty: none`

For the `language` and `faculty` arguments the following case-insensitive values (codes) are available. 
  - `language`
    - `"EN"` for English
    - `"NL"` for Dutch
 
  - `faculty code`
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
