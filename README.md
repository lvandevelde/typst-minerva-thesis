# Typst thesis

A template for writing (PhD) theses with Typst based on guidelines at [Ghent University](https://www.ugent.be/en).

- Improved layout of outlines (compared to standard outlines in Typst 0.13)
- Support of Parts and Appendices
- Figure and equation numbers including the chapter/appendix number
- Customised captions and references
- Possibility of (short) captions of figures and tables for outlines
- Support of subfigures (via subpar.grid)
- Possibility to set background colour (`fill`) and `breakable` feature of figures
- Possibility of left-aligned equations (with a settable left margin)`

# Installation and usage

There are 2 options for importing the modules:

1. Using modules in the working tree <a name="workingtree"></a>

    The main modules are installed in folder `lib`. You can import these modules via their path in the local working tree.

2. Using a local Typst package <a name="localpackage"></a>

    You can install the package and template as a local Typst package. Using  `M̀akefile` you can install the local package (on a Linux system) by executing `make install`. For other systems you can copy the files `typst.toml`and the folders `lib`, `ìmg` and `template` manually to the proper location on your local drive. More explanation on local packages can be found in the "Local packages" section on [this page](https://github.com/typst/packages/#).

    For installing and using the template execute:
    
        typst init @local/ugentthesis:0.1.0  
        cd ugentthesis
        typst watch thesis.typ
 
 
# Example

In the folder `example` a basic example of a PhD thesis is given. It uses [option 1](#workingtree) for importing the modules, but you can switch to [option 2](#localpackage) by commenting the first line and uncommenting the second line in the files.
