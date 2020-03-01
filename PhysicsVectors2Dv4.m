(* ::Package:: *)

BeginPackage["PhysicsVectors2Dv4`"];

x::usage="This Symbol is an independant variable (or coordinate) representing the horizontal distance from the origin (like in Cartesian coordinates) it is used in vector field definition and calculations. It should NEVER be redefined and must be left alone in that respect otherwise the package will break.";
y::usage="This Symbol is an independant variable (or coordinate) representing the vertical distance from the origin (like in Cartesian coordinates) it is used in vector field definition and calculations. It should NEVER be redefined and must be left alone in that respect otherwise the package will break.";
r::usage="This Symbol is an independant variable (or coordinate) representing the total distance from the origin (like in polar coordinates) it is used in vector field definition and calculations. It should NEVER be redefined and must be left alone in that respect otherwise the package will break.";
\[Phi]::usage="This Symbol is an independant variable (or coordinate) representing the azimuthal angle of displacement (like in polar coordinates) it is used in vector field definition and calculations. It should NEVER be redefined and must be left alone in that respect otherwise the package will break.";
Vector2D::usage="The fundamental data type of this package. All vectors are (eventually) evaluated into Vector2D[xPart,yPart,rPart,\[Phi]Part]. Though it can be used in code, you shouldn't need to unless you need to be very exact with your expression's meaning.";
ToCartesian::usage="Converts a given scalar entirely to Cartesian coordinates. Converts a given vector (potentially composed of both Cartesian and polar coordinates and components) into only Cartesian coordinates and components.";
ToPolar::usage="Converts a given scalar entirely to polar coordinates. Converts a given vector (potentially composed of both Cartesian and polar coordinates and components) into only polar coordinates and components.";
ToCartesianList::usage="Converts a vector (given in the syntax of this package, potentially composed of both Cartesian and polar coordinates and components) to a list representation that Mathematica can interpret as a vector in the Cartesian coordinate system. Useful for using the built-in vector operations like Grad, Div, or Curl.";
ToPolarList::usage="Converts a vector (given in the syntax of this package, potentially composed of both Cartesian and polar coordinates and components) to a list representation that Mathematica can interpret as a vector in the polar coordinate system. Useful for using the built-in vector operations like Grad, Div, or Curl.";
FromCartesianList::usage="Converts Mathematica's native list representation of a vector, interpreting it to be in the Cartesian coordinate system, to the to a vector in the syntax of this package. Useful for using the built-in vector operations like Grad, Div, or Curl.";
FromPolarList::usage="Converts Mathematica's native list representation of a vector, interpreting it to be in the polar coordinate system, to the to a vector in the syntax of this package. Useful for using the built-in vector operations like Grad, Div, or Curl.";
ValAt::usage="Converts a point to a list of rules that can be use to retrive the value of a vector (field) at a specific point.";

Begin["`Private`"];

(*Assumptions about the coordinates*)
$Assumptions={{x,y,r,\[Phi]}\[Element]Reals,r>0};

(*Vector addition*)
Vector2D/:Plus[v1_Vector2D,v2_Vector2D]:=Vector2D@@(List@@v1+List@@v2);

(*Scalar multiplication*)
Vector2D/:Times[c_,v_Vector2D]:=Vector2D@@(c List@@v);

(*Dot products*)
Vector2D/:a_. b_Vector2D\[CenterDot]c_ d_Vector2D:=(a b)\[CenterDot](c d);
Vector2D/:CenterDot[v1:Vector2D[x1_,y1_,r1_,\[Phi]1_],v2:Vector2D[x2_,y2_,r2_,\[Phi]2_]]:=
Simplify@Module[{trans1=({
 {Cos[\[Phi]], Sin[\[Phi]]},
 {-Sin[\[Phi]], Cos[\[Phi]]}
}).({
 {x1},
 {y1}
}),trans2=({
 {Cos[\[Phi]], Sin[\[Phi]]},
 {-Sin[\[Phi]], Cos[\[Phi]]}
}).({
 {x2},
 {y2}
})},Module[{u1={r1+trans1[[1,1]],\[Phi]1+trans1[[2,1]]},u2={r2+trans2[[1,1]],\[Phi]2+trans2[[2,1]]}},u1.u2]];

(*Conversion between coordinate systems*)
(*Scalars*)
ToCartesian[scalar_]:=Simplify[scalar/.{r->Sqrt[x^2+y^2],\[Phi]->ArcTan[x,y]}];
ToPolar[scalar_]:=Simplify[scalar/.{x->r Cos[\[Phi]],y->r Sin[\[Phi]]}];
(*Vectors*)
ToCartesian[Vector2D[xhat_,yhat_,rhat_,\[Phi]hat_]]:=Module[{trans=1/Sqrt[x^2+y^2] ({
 {x, -y},
 {y, x}
}).({
 {ToCartesian[rhat]},
 {ToCartesian[\[Phi]hat]}
})},Simplify@Vector2D[xhat+trans[[1,1]],yhat+trans[[2,1]],0,0]];
ToPolar[Vector2D[xhat_,yhat_,rhat_,\[Phi]hat_]]:=
Module[{trans=({
 {Cos[\[Phi]], Sin[\[Phi]]},
 {-Sin[\[Phi]], Cos[\[Phi]]}
}).({
 {ToPolar[xhat]},
 {ToPolar[yhat]}
})},Simplify@Vector2D[0,0,rhat+trans[[1,1]],\[Phi]hat+trans[[2,1]]]];

(*Conversion to/from lists for use with built in functions*)
(*btw, Part automatically outputs a list for you, so you don't have to do it dipshit*)
ToCartesianList[v_Vector2D]:=ToCartesian[v][[1;;2]];
FromCartesianList[l_List]:=Vector2D[l[[1]],l[[2]],0,0];
ToPolarList[v_Vector2D]:=ToPolar[v][[3;;4]];
FromPolarList[l_List]:=Vector2D[0,0,l[[1]],l[[2]]];

(*Controlling how the vectors display*)
Format[v_Vector2D]:=
DisplayForm@Module[{signList,output={}},
v=Simplify@v;
signList=If[NumericQ[#],Sign[FullSimplify[#]/.{Sin[_]->1,Cos[_]->1,Tan[_]->1}],If[#===0,0,If[MatchQ[#,Times[-1,___]]||FactorTermsList[#][[1]]<0,-1,1]]]&/@List@@v;
({num,letter}\[Function]
Switch[v[[num]],
1,output=Append[output,Unevaluated@Sequence["+",OverscriptBox[letter,"^"]]],
-1,output=Append[output,Unevaluated@Sequence["-",OverscriptBox[letter,"^"]]],
0,Null,
_,output=Append[output,Unevaluated@Sequence[
Switch[signList[[num]],
-1,"-",
1,"+",
0,"0"
],
If[Head[v[[num]]]===Plus,
Unevaluated@Sequence["(",v[[num]] signList[[num]],")"],
v[[num]] signList[[num]]
],
OverscriptBox[letter,"^"]
] 
]
])@@@Transpose[{{1,2,3,4},{x,y,r,\[Phi]}}];
If[output[[1]]=="+",output=Drop[output,1],output];
RowBox[output]
];

(*For evaluating these vectors at specific points*)
ValAt[a_,b_]:=ValAt[a,b,"Cartesian"];
ValAt[a_,b_,"Cartesian"]:={x->a,y->b,r->Sqrt[a^2+b^2],\[Phi]->ArcTan[a,b]};
ValAt[a_,b_,"Polar"]:={x->a Cos[b],y->a Sin[b],r->a,\[Phi]->b};

(*Defining the symbols native to the coordinate system*)
\!\(\*OverscriptBox[\(x\), \(^\)]\)^=Vector2D[1,0,0,0];
\!\(\*OverscriptBox[\(y\), \(^\)]\)^=Vector2D[0,1,0,0];
\!\(\*OverscriptBox[\(r\), \(^\)]\)^=Vector2D[0,0,1,0];
\!\(\*OverscriptBox[\(\[Phi]\), \(^\)]\)^=Vector2D[0,0,0,1];

End[];
EndPackage[];
