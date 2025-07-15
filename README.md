<h1>
<img width="2146" height="302" alt="Typst-UGent-thesis-banner" src="https://github.com/user-attachments/assets/918006a2-6d2f-4734-ac0d-db8760952db2" />
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

    The main modules are installed in folder `lib`. You can import these modules via their path in the local working tree.

2. <a name="localpackage"></a> Using a local Typst package 

    You can install the package and template as a local Typst package. Using  `M̀akefile` you can install the local package (on a Linux system) by executing `make install`. For other systems you can copy the files `typst.toml`and the folders `lib`, `ìmg` and `template` manually to the proper location on your local drive. More explanation on local packages can be found in the "Local packages" section on [this page](https://github.com/typst/packages/#).

    For installing and using the template execute:
    
        typst init @local/ugentthesis:0.1.0  
        cd ugentthesis
        typst watch thesis.typ
 
## Ghent University specific features

The function `titlepage()` used in `titlepage.typ` is specific for Ghent University theses as it uses logos of Ghent University and its faculties (stored in folder `img`) for building the titlepage. You can modify this function or build your titlepage manually for usage at other institutions.

 
# Example

In the folder `example` a basic example of a PhD thesis is given. It uses [option 1](#workingtree) for importing the modules, but you can switch to [option 2](#localpackage) by commenting the first line and uncommenting the second line in the files.

In `example/Ch1/ch1.typ` some examples of figures with a short version of the captions for the outline (List of Figures) by using `m̀yfigure` and `mysubpargrid` are given.
