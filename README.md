# PhysicsVectors

A simple library to use Griffith's vector notation in Mathematica instead of the built in list format.
This library is built to make manipulating vectors using lists of symbols in Mathematica when doing vector algebra or calculus easier and intuitive, primarily by implementing commonly used notations. To be clear, when I say vectors throughout all this, I technically mean vector fields.

Mathematica's built-in vectors are lists. These do not have a coordinate system, the user simply must keep track of a particular vector's intended coordinate system themselves, making their usage clunky and error prone. Common actions like adding, dotting, or crossing vectors can only be done programmatically if they are in the same coordinate system, if they aren't, then transformations are required. Keeping track of transformations manually can be confusing with multiple vectors and coordinate systems and unfortunatly the built-in functions are verbose (and overkill) for many operations. 

This library seeks to streamline that process (at least in the cartesian, cylindrical, and spherical coordinate systems) by using notations common to physics.

There are several files listed mostly for history. They are not advised for use. These are versions 2 and 3 (I have lost version 1 if you were curious as to its absence. However is was more or less a direct copy of the amazing answer provided by this poster on stackexchange: https://mathematica.stackexchange.com/questions/211502/how-can-i-use-a-unit-vector-notation-found-in-physic-texts). Version 4 is more complete. It is a stable build and the currently advised version. It is only in 2d, it implements the common operations of adding, dotting, and scalar multiplying. Most importantly, it can transform vectors from one coordinate system to another (the only two implemented are 2d cartesian and polar). It also requires you to use the symbols x y r $\phi$ in your code. There are consequences to this described in the notebook. The main feature however, which is the nice physics syntax/notation is fully implemented.

There are also files currently in development, specifically version 5 and of course a 3d version. Currently the goals to be implemented with version 5 are: 
have the system recognize vectors, magnitudes, and unit vectors and use them correctly in accordance to standard notation (implemented)
produce a clean and intuitive format for transformations of vectors 
implement the user creation of alternate frames of reference using arbitrary variables (under development) that can be specified as arbitrary transformations (though in the physical case these would only be translations and rotations) of frames already specified in the system

Currently the 3d version is still being implemented at the level of version 4. Once version 5 is stable, then the 3d version will be upgraded to version 5 functionality. 

Naturally there are numerous other features to be implemented, but they are more or less bells and whistles that will be added as time permits. The features listed here are by far the more important ones. 
