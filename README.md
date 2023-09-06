# Calculator_qml
A QML calculator is a calculator that is written in QML, a declarative language for creating user interfaces. QML calculators are typically used in Qt applications, but they can also be used in other frameworks that support QML.
The calculator will have a simple user interface with a display, a number pad, and buttons for the basic arithmetic operations. This QML file defines a simple calculator with four buttons: addition, subtraction, multiplication, and division. The buttons are connected to the onButtonClicked signal, which is emitted when a button is clicked. The onButtonClicked handler gets the text of the button that was clicked and uses it to perform the appropriate calculation. The result of the calculation is then displayed in the display text field.
The C++ file for the calculator would contain the code that defines the business logic of the calculator. This code would need to implement the following functions:
prompt(): This function would prompt the user to enter a number.
add(): This function would add two numbers together.
subtract(): This function would subtract two numbers from each other.
multiply(): This function would multiply two numbers together.
divide(): This function would divide two numbers.
The C++ file would also need to connect the onButtonClicked signal from the QML file to the appropriate function
