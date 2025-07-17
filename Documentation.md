# Documentation

This documentation explains the modules and function of the package.

Below, for every function the named arguments and their default values are listed.

## Module `ugentthesis`

Module `ugentthesis` includes all functions needed for the main file containing settings and imports of all contents (title page, front matter, chapters, appendices and back matter (such as a bibliography)).

### Functions

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

The following functions are used for setting the different parts of a thesis:
  
- `frontmatter`
  - `showheading: true`
- `chapter`
- `appendix`
  - `flyleaf: [Appendices]`  
  sets the title on the flyleaf before the appendices,  `none` means no flyleaf
- `backmatter`
  - `showheading: true`
  
Setting the argument `showheading: false` in `frontmatter` or `backmatter` can be used to add pages with a first-level heading to the Table of Contents without showing the heading on the page itself  
  
These functions are usually used in show rules, such as
    
`#show: thesis.with(...)`
    

  
## Module `chapterdefs`

Module `chapterdefs` contains some functions to be used in files for chapters, appendices, etc. 
Currently, these functions are only related to extra features for figures & tables, compared to the standard `figure` function.

Functions:

- `myfigure`  
  This function has some extra features for:
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

The standard arguments of figure() / subpar.grid() are still valid. 

## Mudule `titlepage`

This module only contains one function: `titlepage`.

### `titlepage`

The function `titlepage` can (for now) be used for Ghent University theses only. Otherwise the title page has to be build manually.

  - `title`: `none`
  - `author`: `none`
  - `supervisors`: `none`
  - `date`: `none`
  - `language: "EN"`  
    "EN" for English or "NL" for Dutch, case-insensitive
  - `faculty`: `none`  
    faculty code, case-insensitive  
     - Arts and Philosophy: "LW"
     - Law and Criminology: "RE"
     - Sciences: "WE"
     - Medicine and Health Sciences: "GE"
     - Engineering and Architecture: "EA"
     - Economics and Business Administration: "EB"
     - Veterinary Medicine: "DI"
     - Psychology and Educational Sciences: "PP"
     - Bioscience Engineering: "BW"
     - Pharmaceutical Sciences: "FW"
     - Political and Social Sciences: "PS
  - `description`: `none`
  - `ids`: `none`  
    ID(s) such as ISBN, NIR code, ... : single string/content or array
  - `font`: `auto`  
    `auto` means the current font (usually, `font` set via `thesis`) 
  - `fontsize`: `auto`  
    base font size  
    `auto` means the current font size (usually, `fontsize` set via `thesis`) 

  
