# MVVM in SWift


This is a Sample Project developed in swift 4, used MVVM Architecture. 


# What is MVVM ?

MVVM is proposed by John Gossman in 2005. The main purpose of the MVVM is to move the data state from the View to the ViewModel. 

According to the definition, the View consists of only visual elements. In the View, we only do things like layout, animation, initializing UI components, etc. There’s a special layer between the View and the Model called the ViewModel. The ViewModel is a canonical representation of the View. That is, the ViewModel provides a set of interfaces, each of which represents a UI component in the View. We use a technique called “binding” to connect UI components to ViewModel interfaces. So, in MVVM, we don’t touch the View directly, we deal with business logic in the ViewModel and thus the View changes itself accordingly. We write presentational things such as converting Date to String in the ViewModel instead of the View. Therefore, it becomes possible to write a simpler test for the presentational logic without knowing the implementation of the View.

