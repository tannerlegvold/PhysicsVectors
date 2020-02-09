# PhysicsVectors
Mathematica's built-in vectors are lists. These do not have a coordinate system, the user simply must keep track of a particular vector's intended coordinate system themselves, making their usage clunky and error prone. Common actions like adding, dotting, or crossing vectors can only be done programmatically if they are in the same coordinate system, if they aren't, then transformations are required. Keeping track of transformations manually can be confusing with multiple vectors and coordinate systems and unfortunatly the built-in functions are verbose (and overkill) for many operations. 

This library seeks to streamline the process of working with vectors (at least in the cartesian, cylindrical, and spherical coordinate systems) by using notations common to physics. 

# Warning
Even the current best version: version 4 still has a few bugs in it relating to algebraic manipulations, and may give incorrect results. It is easy to find these by random parts of moderatly complex expressions back and forth between Cartesian and polar. Until a solution is found, obviously don't rely on this for anything important without verifying the results.

The OldVersions folder contains the older copies of the library and is there mostly for historical purposes. Most of those implementations suck and are not advised for standard use.

## Use
To use the library, simply download the files ```PhysicsVectors2Dv4.m``` and ```2-d Vector Library Palette``` and install them however you wish. One way is: open Mathematica, click on File->Install, and use the install wizard to install the package file and the palette file from wherever you downloaded them to. 

There will be an example notebook uploaded soon to show how to use the library. But to get started simply evaluate (after having installed the ```PhysicsVectors2Dv4.m``` file of course) the code ```<<PhysicsVectors2Dv4` ``` and the package should load properly. Some side notes: if you are in a session where you plan to use and load the package, don't evaluate anything including symbols that are used in the package without having first loaded the package. This will create context conflicts that are annoying to resolve, if you do this, the easiest way to fix it is simply restart the kernel. The commonly used symbols that the package requires are: x, y, r, and \[phi]. Note that the complete list of symbols can be found in the package file itself or by examining the package's context, which is ```PhysicsVectors2Dv4` ```.

## Future Goals
There are also versions currently in development, specifically version 5 and of course a 3d version. Currently the goals to be implemented with version 5 are: 
* have the system recognize vectors, magnitudes, and unit vectors and use them correctly in accordance to standard notation (implemented)
* ensure the system works with piecewise defined functions
* produce a clean and intuitive format for transformations of vectors 
* implement the user creation of alternate coordinate frames using arbitrary variables (under development) that can be specified as arbitrary transformations of frames already specified in the system
* fix the formatter (under development)

Currently the 3d version is still being implemented at the level of version 4. Once version 5 is stable, then the 3d version will be upgraded to version 5 functionality. 

Naturally there are other features to be implemented (of varying degrees of importance and difficulty), but they are all more or less bells and whistles that are not neccessary to the base library:
* implementation of time varying quantities, such as time varying vector fields
* support for reference frames in the context of special relativity
* support for non-inertial reference frames (essentially just time varying transformations)
* separation of vector fields and vectors, allowing implementation of kinematic quantities and other physical effects
* small editing of the built in functions: Grad, Div, and Curl to make working with them less verbose
* small set of common electric and magnetic fields such as: point charge, infinite line of current, point electric dipole, point magnetic dipole. And maybe others. 
* inclusion of formulas a few common electric and magnetic quantities like the Poynting vector and the Maxwell stress tensor
* support for making basic plots and visualizations with the built-in Mathematica functions
* potentially very basic integral support (tentative)

It is not possible for all of these features to be implemented side by side: some users won't want any modification of the built in functions (such as Grad, Div, and Curl); some users have no need for all the extra E&M components; and I'm sure any special relativity implementation would clash with a *lot* of other features. So, the exact details of how all the different versions will be organized on this site and on individuals' copies is yet to be determined.
