<h1>
<img width="2146" height="302" alt="Typst-UGent-thesis-banner" src="https://github.com/user-attachments/assets/4d31ee26-9639-4566-9142-68ef41a2a19f" />
</h1>

# Typst thesis

A template for writing theses with [Typst](https://typst.app/) following guidelines at [Ghent University](https://www.ugent.be/en) (UGent) and providing additional features in comparison to standard functions of Typst 0.13:

- Improved layout of outlines (in particular for outline entries spanning multiple lines)
- Support of Parts and Appendices
- Figure and equation numbers including the chapter/appendix number
- Omission of page numbers on blank pages before the beginning of a chapter
- Customised captions and references
- Support of subfigures (via package [subpar](https://typst.app/universe/package/subpar))
- Optional (short) versions of figure captions for outlines (List of Figures, List of Tables)
- Possibility of left-aligned equations (with a settable left margin)
- Possibility to set background colour (`fill`) and `breakable` feature of figures (experimental)

# Installation and usage


There are 2 options for importing the locally installed package modules:

1. <a name="workingtree"></a> Using modules in the working tree 

    The main module `lib.typ` is installed in folder `lib`. You can import this module via its path in the local working tree, see, e.g., the files in folder `example` where this option is used as explained in [Example](#example).

2. <a name="localpackage"></a> Using a local Typst package 

    You can install the package and template as a local Typst package. Using  `Makefile` you can install the local package (on a Linux system) by executing `make install`. For other systems you can copy the files `typst.toml`and the folders `lib`, `img` and `template` manually to the proper location on your local drive. More information on local packages can be found via the ["Local packages"](https://github.com/typst/packages/?tab=readme-ov-file#local-packages) section of the Typst packages documentation.

    For installing and using the template execute:
    
        typst init @local/ugentthesis:0.1.3  
        cd ugentthesis
        typst watch thesis.typ
 

# Functions

The documentation on the functions of this package can be found in [`Documentation.md`](Documentation.md) 
 
# Example

In the folder `example` a basic example of a PhD thesis is given. 

The files in this folder illustrate most of the functions of the package, in particular:

- `thesis.typ`: the main file with settings and imports of all contents (title page, front matter, chapters, appendices and bibliography);
- `Ch1/ch1.typ`: the first chapter with tables and figures with extra features (compared to the standard `figure()` function;
- `Titlepage/titlepage.typ`: the title page using the `titlepage` function which is specific for Ghent University theses as it uses logos of Ghent University and its faculties for building the title page. You can modify this function or build your title page manually for usage at other institutions.


The example uses [option 1](#workingtree) for importing the modules, but you can switch to [option 2](#localpackage) by commenting the first line and uncommenting the second line in the files.

# Fonts

In the  [example](#example) and the template, the lines for selecting the "UGent Panno Text" font have been commented, such that `thesis.typ`can be compiled out-of-the-box. The "UGent Panno Text" font is not a free font and can only be used for Ghent University purposes. For using this font, it has to be installed on your system (with this specific font name).


# License
This template is licensed under the MIT license.
The logos and icons of Ghent University in folder `img` are copyrighted and are not covered by the MIT license. Use them only when there is a direct link to Ghent University. 
