<img width="2146" height="302" alt="Typst-minerva-thesis-banner" src="https://github.com/user-attachments/assets/0a116493-7518-46c2-bd72-c51f20adbee0" />

---
# `minerva-thesis` - a Typst thesis template

The `minerva-thesis` package provides a template for writing doctoral and master's theses with [Typst](https://typst.app/) presenting both [Ghent University](https://www.ugent.be/en) specific features and additional generic functions and features (in comparison to standard functions of Typst 0.13):

- A Ghent University specific title page. 
- Improved layout of outlines (in particular for outline entries spanning multiple lines)
- Support of Parts and Appendices
- Figure and equation numbers including the chapter/appendix number
- Omission of page numbers on blank pages before the beginning of a chapter
- Customised captions and references
- Support of subfigures via package [`subpar`](https://typst.app/universe/package/subpar)
- Optional (short) versions of figure captions for outlines (List of Figures, List of Tables)
- Possibility of left-aligned equations (with a settable left margin)
- Possibility to set a background colour (`fill`) for figures and a `breakable` feature for figures (possible span over multiple pages, *experimental*)
- Possibility to include an extended abstract, i.e. an abstract in two-column format with a separate bibliography (via package [`alexandria`](https://typst.app/universe/package/alexandria))
- Handling of abbreviations via package [`abbr`](https://typst.app/universe/package/abbr)

## Installation and usage

### Typst Universe
As the package is available in the [Typst Universe](https://typst.app/universe/package/minerva-thesis/0.2.0), you can use the package in the `preview` namespace via the Typst app and via the Typst CLI:

    typst init @preview/minerva-thesis:0.2.0  
    cd minerva-thesis
    typst watch thesis.typ

In your Typst files, you can import the functions of the package via:

    #import "@preview/minerva-thesis:0.2.0": *

### Local installation    
    
If you want to install the modules of the package locally, download the files of this repository and import the locally installed modules via one of the following options:

1. <a name="filepath"></a> Via the path of the main module file  

    The main module `lib.typ` is installed in folder `lib`. You can import this module via its file path, e.g.
    
        #import "../lib/lib.typ": *

2. <a name="localpackage"></a> By installing `minerva-thesis` as a local Typst package 

    You can install the package and template as a local Typst package by using the `Makefile` (on a Linux system) and executing `make install`. For other systems you can copy the files `typst.toml` and the folders `lib`, `img` and `template` manually to the proper location on your local drive. More information on local packages can be found via the ["Local packages"](https://github.com/typst/packages/?tab=readme-ov-file#local-packages) section of the Typst packages documentation. 
    For using the package of the `local` namespace, replace `@preview` by `@local` in the code above.


## Functions

The documentation on the functions of this package can be found in [`docs/Documentation.md`](docs/Documentation.md) 
 
## Examples

In the folder `examples` basic examples of a PhD and a master's thesis are given. 

These example files illustrate most of the functions of the package, in particular:

- `thesis.typ`: the main file with settings and imports of all contents (title page, front matter, chapters, appendices and bibliography);
- `Ch1/ch1.typ`: the first chapter with tables and figures with extra features (compared to the standard `figure` function);
- `FrontMatter/title-page.typ` (in the PhD thesis example): a tailored title page using the `title-page` function which is specific for Ghent University theses as it uses logos of Ghent University and its faculties for building the title page. You can modify this function or build your title page manually for usage at other institutions.
- `FrontMatter/extended-abstract.typ` (in the master's thesis example): an extended abstract in double-column format with a separate bibliography


## Fonts

In the [examples](#examples) and the template, the lines for selecting the "UGent Panno Text" font have been commented, such that `thesis.typ` can be compiled out-of-the-box. The "UGent Panno Text" font is not a free font and can only be used for Ghent University purposes. For using this font, it has to be installed on your system (with this specific font name).


## License
This template is licensed under the MIT license.
The logos and icons of Ghent University in folder `img` are copyrighted and are not covered by the MIT license. Use them only when there is a direct link to Ghent University. 
