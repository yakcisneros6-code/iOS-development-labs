/*:
## Exercise - Variables
 
 Declare a variable `schooling` and set it to the number of years of school that you have completed. Print `schooling` to the console.
 */
var schooling: Int = 10
print(schooling)

//:  Now imagine you just completed an additional year of school, and update the `schooling` variable accordingly. Print `schooling` to the console.
schooling = schooling + 1
print(schooling)

//:  Does the above code compile? Why is this different than trying to update a constant? Print your explanation to the console using the `print` function.
print("The code compiles because 'schooling' is a variable declared with 'var', which allows its value to be changed.")
print("This is different from a constant declared with 'let', which cannot be updated after its initial assignment.")


/*:
[Previous](@previous)  |  page 3 of 10  |  [Next: App Exercise - Step Count](@next)
 */
