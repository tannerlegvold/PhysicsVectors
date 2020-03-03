# Warning
Version 4 (the current best version) still has a few bugs in it relating to algebraic manipulations, and may give incorrect results. Obviously don't rely on this for anything important without verifying the results. Additionally, a few functions are not currently implemented, the usage notebook explains all the current issues and what not to use.

# PhysicsVectors
Mathematica's built-in vectors are lists. These do not have a coordinate system, the user simply must keep track of a particular vector's intended coordinate system themselves, making their usage clunky and error prone. Additionally, usage of the built-in functions is cluncky and overkill for many operations.

This library seeks to streamline the process of working with vectors (at least in the cartesian, cylindrical, and spherical coordinate systems) by using notations common to physics. 

The OldVersions folder contains the older copies of the library and is there mostly for historical purposes. Most of those implementations are not advised for standard use.

## Use
To use the library, simply download the files ```PhysicsVectors2Dv4.wl``` and ```2-d Vector Library Palette``` and install them however you wish. One way is: open Mathematica, click on File->Install, and use the install wizard to install the package file and the palette file from wherever you downloaded them to. 

There is an example notebook called ```Example usage of PhysicsVectors2Dv4.nb```. But to get started simply evaluate (after having installed the ```PhysicsVectors2Dv4.wl``` file of course) the code ```<<PhysicsVectors2Dv4` ``` and the package should load properly.

## Future Goals
There are also versions currently in development, specifically version 5 and of course a 3d version. Currently the goals to be implemented with version 5 are: 
* have the system recognize vectors, magnitudes, and unit vectors and use them correctly in accordance to standard notation (implemented)
* ensure the system works with piecewise defined functions
* produce a clean and intuitive format for transformations of vectors 
* implement the user creation of alternate coordinate frames using arbitrary variables (under development) that can be specified as arbitrary transformations of frames already specified in the system

There are also goals I want to implement, but likely are best to be pushed off to a future version. They are:
* rework each frame to only have one set of coordinates: the "Cartesian"/natural coordinates of that frame. This will make implementation of new/custom coordinate frames much more natural. I feel it is cleaner overall (it might even cut down on code size). I shoudl point out, it will take three coordinate frames with this new addition to implement what the current version has in only one frame. That is ok, and actually better by some standards.
* fix the formatter (under development)

Currently the 3d version is still being implemented at the level of version 4. Once version 5 is stable, then the 3d version will be upgraded to version 5 functionality. 

Naturally there are other features to be implemented (of varying degrees of importance and difficulty), but they are all more or less bells and whistles that are not neccessary for the base library:
* implementation of time varying quantities, such as time varying vector fields
* support for reference frames in the context of special relativity
* support for non-inertial reference frames (essentially just time varying transformations)
* make manipulation functions (like ToCartesian and ToPolar) work with numeric vectors, which may require...
* separation of vector fields and vectors, allowing implementation of kinematic quantities and other physical effects
* small editing of the built in functions: Grad, Div, and Curl to make working with them less verbose
* small set of common electric and magnetic fields such as: point charge, infinite line of current, point electric dipole, point magnetic dipole. And maybe others. 
* inclusion of formulas a few common electric and magnetic quantities like the Poynting vector and the Maxwell stress tensor
* support for making basic plots and visualizations with the built-in Mathematica functions
* potentially very basic integral support (tentative)
* produce a "nice" mathematical way of enterying expressions representing the gradient, divergence, and curl of expressions using the del operator
* perhaps consider overloading the Set operator so that if the rhs is a vector, it will default to use the UpSet operator. This could work, and, though the UpSet operator honestly isn't that bad, will actually make some expressions look more mathematical

It is not possible for all of these features to be implemented side by side: some users won't want any modification of the built in functions (such as Grad, Div, and Curl); some users have no need for all the extra E&M components; and I'm sure any special relativity implementation would clash with a *lot* of other features. So, the exact details of how all the different versions will be organized on this site and on individuals' copies is yet to be determined.

On the topic calculus functions like Grad, Div, and Curl. I have decided not to include any in the base package (in version 4 right now). Partly to keep the package small, and partly because opinions vary on how to correctly implement them: some would say to redefine the built in functions with Unprotect, some would make helper functions with different names, and some simply won't use them at all. Instead, I have provided helper functions in the usage notebook to get the user started if they need them. This gets the best of both worlds by providing the functions for people who need them and staying out of the way of people that don't. I encourage the user to program their own behavior and syntax if they so desire. Though note that support for a "nice" mathematical syntax, using the del operator and such, for this is on the list of "bells and whistles" features for the future.
