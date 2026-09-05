<img width="2146" height="302" alt="Typst-minerva-thesis-banner" src="https://github.com/user-attachments/assets/913af06f-31a0-4632-8b21-0caf1bb4f681" />

---
# `minerva-thesis` - a Typst thesis template

The `minerva-thesis` package provides a template for writing doctoral and master's theses with [Typst](https://typst.app/) using both generic and [Ghent University](https://www.ugent.be/en) specific functions and features:

- A Ghent University specific title page (optional);
- Multi-language support: The terminology (including terms for "chapter", "part", "section", etc. and various supplements) is pre-defined (and settable) for English and Dutch dissertations, but can be defined for other languages by the user.
- Improved layout of outlines (in particular for outline entries spanning multiple lines);
- Support of Parts, Chapters and Appendices;
- Optional page headers via package [`hydra`](https://typst.app/universe/package/hydra);
- Possibility of left-aligned equations (with a settable left margin);
- Figure and equation numbers including the chapter/appendix number;
- Support of user-defined kinds of figures, next to the standard kinds (`image`, `table` and `raw`), with respect to captions, references and outlines;
- Support of subfigures via package [`subpar`](https://typst.app/universe/package/subpar);
- Optional (short) versions of figure captions for outlines (List of Figures, List of Tables);
- Support of background colour (`fill`) for figures and a `breakable` feature for figures (possible span over multiple pages, *experimental*);
- Automised references to a list or a range of elements, e.g. references to multiple figures: "Figures 1.1, 1.4, and 1.5" or "Figures 1.1-1.3"; 
- Automatic omission of page numbers and headers on blank pages;
- Possibility to include an extended abstract, i.e. an abstract in two-column format;
- Handling of abbreviations via package [`abbr`](https://typst.app/universe/package/abbr);
- Highly-configurable layout (text parameters (font, size, weight, etc.) and functions (smallcaps, etc.), alignment, ...) of chapter titles, headers, captions, etc.


## Installation and usage

### Typst Universe

The [released versions](https://github.com/lvandevelde/typst-minerva-thesis/releases) (from 0.1.3) are available in the [Typst Universe](https://typst.app/universe/package/minerva-thesis/). For these versions, you can use the package in the `preview` namespace via the Typst app and via the Typst CLI, e.g. for version 0.3.0:

    typst init @preview/minerva-thesis:0.3.0 
    cd minerva-thesis
    typst watch thesis.typ

In your Typst files, you can import the functions of the package via:

    #import "@preview/minerva-thesis:0.3.0": *

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

In the folder [examples](examples) basic examples of PhD and master's theses are given. 

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
