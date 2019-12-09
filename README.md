# swift-practice

This is the repo to practice Ray W's class

------------------
SWIFT UI

Portrait v Landscape
896 x 414 points in Portrait
414 x 896 in Landscape 

Changing color value of a pixel creates something visible
The more pixels, the more clear

1 point == 2 pixels
Devs work in points; Designers work in pixels

VIEW
anything that can be drawn on a screen
views can be a container
Types of "views" -- Button, Text, VStack, HStack

STATE 
can be very complex
SwiftUI is built to solve the state mismatch problem
It is done through Bindings. A particular Binding will always be associated with a particular state view

STRINGS
a sequence of characters.  interpolation \() (JS --> ${}  

VARIABLES & DATA TYPES
var variableName : Type (Bool, Double, etc) = InitialValue (an intial value) (@State is optional)

------------------
SWIFT BASICS

SWIFT STANDARD LIBRARY
Shift + Command + 0 

WRITING METHODS
func someFunctionName() -> ReturnType { 
	// code body here... 
	return someObject
}

VAR v CONSTANTS
var creates a variable (if it could change)
let is a constant
if a value won't change, make it a let

TYPE INFERENCE
better to not specify the type (delete : Type). To check, hit Option and Click over the variable

VARIABLE SCOPE
DRY -- Don't Repeat Yourself

IMAGES
1x iOS 9 or older
2x 100x100 most iPhones, retinas screens
3x 150X150 super high red retina HD

VIEWMODIFIER
must follow a particular syntax to fulfill that promise

NEW VIEW
new >> file

SCENE DELEGATE
responsible for the app starting up

PUTTING IT ON YOUR PHONE
appleID + xcode
build and run
connect your phone to the Mac
Window >> Devices & Simulators >> 
unlock device and hold the home button
