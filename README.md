<h1>
<img width="2146" height="302" alt="Typst-UGent-thesis-banner" src="https://github.com/user-attachments/assets/4d31ee26-9639-4566-9142-68ef41a2a19f" />
</h1>

# Typst thesis

A template for writing (PhD) theses with [Typst](https://typst.app/) based on guidelines at [Ghent University](https://www.ugent.be/en).

- Improved layout of outlines (compared to standard outlines in Typst 0.13, in particular for outline entries spanning multiple lines)
- Support of Parts and Appendices
- Figure and equation numbers including the chapter/appendix number
- Automatic omission of page numbers on blank pages (e.g. blank page before a chapter)
- Customised captions and references
- Support of subfigures (via package [subpar](https://typst.app/universe/package/subpar))
- Optional (short) versions of figure captions for outlines (List of Figures, List of Tables)
- Possibility of left-aligned equations (with a settable left margin)
- Possibility to set background colour (`fill`) and `breakable` feature of figures (experimental)
`

# Installation and usage

## Modules

There are 2 options for importing the package modules:

1. <a name="workingtree"></a> Using modules in the working tree 

    The main modules are installed in folder `lib`. You can import these modules via their path in the local working tree, see, e.g., the files in folder `example` where this option is used as explained in [Example](#example).

2. <a name="localpackage"></a> Using a local Typst package 

    You can install the package and template as a local Typst package. Using  `M̀akefile` you can install the local package (on a Linux system) by executing `make install`. For other systems you can copy the files `typst.toml`and the folders `lib`, `ìmg` and `template` manually to the proper location on your local drive. More explanation on local packages can be found in the "Local packages" section on [this page](https://github.com/typst/packages/#).

    For installing and using the template execute:
    
        typst init @local/ugentthesis:0.1.1  
        cd ugentthesis
        typst watch thesis.typ
 
## Ghent University specific features

The function `titlepage()` used in `titlepage.typ` is specific for Ghent University theses as it uses logos of Ghent University and its faculties (stored in folder `img`) for building the titlepage. You can modify this function or build your titlepage manually for usage at other institutions.

 
# Example

In the folder `example` a basic example of a PhD thesis is given. It uses [option 1](#workingtree) for importing the modules, but you can switch to [option 2](#localpackage) by commenting the first line and uncommenting the second line in the files.

In `example/thesis.typ` the font "UGent Panno Text" is used. This is only relevant for Ghent University theses—it is not a free font and can only be used for Ghent University purposes—and requires this font has been installed on your system (with this specific font name) if you want to compile the example. Remove or change these font settings in `example/thesis.typ` otherwise. In `template/thesis.typ` the font settings using "UGent Panno Text" have been commented.

In `example/Ch1/ch1.typ` some examples of figures with a short version of the captions for the outline (List of Figures) by using `m̀yfigure` and `mysubpargrid` are given.

# License
This template is licensed under the MIT license.
The logos and icons of Ghent University in folder `ìmg` are copyrighted and are not covered by the MIT license. Use them only when there is a direct link to Ghent University. 
