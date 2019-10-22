// Create a variable named `i`. This is mutable (changeable) since it is marked with `var`.
var i = 0

// All variables must have a type, but Swift knows that `i` is of type `Int`, because of type inference.
// We can explicitly say that `i` is of type `Int` by writing:
// var i: Int = 0
// This isn't conventional, and you should let Swift figure out the type with the value you give it.

// We can create a constant (cannot be changed) with `let`:
let myConstant = "Hi!"

// Since `myConstant` is a constant, we can't change it. If we write this:
// myConstant = 4
// We will get an error. (You can see the error by moving your cursor on the line and pressing Cmd+Slash)

// ALWAYS use a `let` constant instead of `var` when the value won't change.

// We have a few low-level types in Swift, like
// `Bool`, `Int`, `String`, `Double`
// Bool is `true` or `false`, and `String` is like "Hello!" and `Double` is an Int but with a decimal

// To make a variable of type `Double`, we have to put a .0 at the end or mark it explicitly with `Double`
// Example:
// let myDouble = 0 // THIS IS NOT A DOUBLE! This is an Int!
// let myDouble = 0.0 // Since we put a .0 at the end, Swift decides it's a double
// let myDouble: Double = 0 // This is also a Double, since we explicitly set it as a `Double`. In this case, it's ok to say the type.

// Making a function:
func addOneToNumber(_ number: Int) -> Int {
	return number + 1
}

// Every function has to start with `func`.
// The name comes after. In our case, it's `addOneToNumber`
// The parameter list comes next. Parameters are separated with a comma, and must be passed in whenever you call the function.
// We have one parameter in this function, named `number`. We can reference `number` inside of the function.
// This function returns an `Int`, you specify the return type after `->`.
// Inside of the function, you return `number` + 1
// Remember: If you give a return type to a function, that function must always return something of that type!
// When you return something from a function, everything stops! Nothing can execute after a return happens.

// You can call `addOneToNumber` like this:

addOneToNumber(5)
// Returns 6

// Since our outside name for our parameter `number` is an underscore, we don't have to say `parameter: 5` inside of the parameter list.

// if statements:

let myNumber = 1

if myNumber == 1 {
	print("myNumber is 1!")
} else {
	print("myNumber is not 1...")
}

// The == operator compares two values and returns a `Bool`: true or false

// === EXERCISE ===

// Grades are important! We need a function that takes in your grade in a percentage format and returns a letter.

// Remember:
// There are a few different types in Swift, here's a few: Int, String, Double
// A Double is a decimal like 0.5 or 9.8
// There are a few comparison operators in Swift:
// == : compares two values
// <  : checks if the left value is less than the right
// <= : checks if the left value is less than or equal to the right
// >  : checks if the left value is greater than the right
// >= : checks if the left value is greater than or equal to the right

// Each of these returns a value of type Bool, which is either true or false
// You can use an if statements based on these Bool values!

// Make a function named `gradeLetterFromPercentage` that takes in a grade (Double, since it can be a decimal):
// Returns "A+" if your grade is between 97 and 100 (inclusive)
// Returns "A" if your grade is between 93 and 96 (inclusive)
// Returns "A-" if your grade is between 90 and 92 (inclusive)
// Returns "B+" if your grade is between 87 and 89 (inclusive)
// Returns "B" if your grade is between 83 and 86 (inclusive)
// Returns "B-" if your grade is between 80 and 82 (inclusive)
// Returns "C+" if your grade is between 77 and 79 (inclusive)
// Returns "C" if your grade is between 73 and 76 (inclusive)
// Returns "C-" if your grade is between 70 and 72 (inclusive)
// Returns "D+" if your grade is between 67 and 69 (inclusive)
// Returns "D" if your grade is between 63 and 66 (inclusive)
// Returns "D-" if your grade is between 60 and 62 (inclusive)
// Returns "F" if your grade is less than or equal to 59

// Fill out the body of this function! You can make as many other functions as you like!
// Here's some hints: Use if statements and comparison operators.

func gradeLetterFromPercentage(_ grade: Double) -> String {
	// TODO: Fill this out for your exercise
}

// Click run on the line below to test your work! You can see the output on the right, and what you got wrong.
// Ignore this error below, it's an error in Xcode.
runTests()

// === DO NOT MODIFY ===

func runTests() -> String {
	if let message = expectGradeLetterFromPercentage(100, toBe: "A+") { return message }
	if let message = expectGradeLetterFromPercentage(93, toBe: "A") { return message }
	if let message = expectGradeLetterFromPercentage(91.5, toBe: "A-") { return message }
	if let message = expectGradeLetterFromPercentage(89, toBe: "B+") { return message }
	if let message = expectGradeLetterFromPercentage(83, toBe: "B") { return message }
	if let message = expectGradeLetterFromPercentage(81, toBe: "B-") { return message }
	if let message = expectGradeLetterFromPercentage(79, toBe: "C+") { return message }
	if let message = expectGradeLetterFromPercentage(75.6, toBe: "C") { return message }
	if let message = expectGradeLetterFromPercentage(72, toBe: "C-") { return message }
	if let message = expectGradeLetterFromPercentage(67.0, toBe: "D+") { return message }
	if let message = expectGradeLetterFromPercentage(64, toBe: "D") { return message }
	if let message = expectGradeLetterFromPercentage(60, toBe: "D-") { return message }
	if let message = expectGradeLetterFromPercentage(59, toBe: "F") { return message }
	if let message = expectGradeLetterFromPercentage(20, toBe: "F") { return message }
	if let message = expectGradeLetterFromPercentage(0, toBe: "F") { return message }
	return "All tests passed"
}

func expectGradeLetterFromPercentage(_ grade: Double, toBe expectedValue: String) -> String? {
	let result = gradeLetterFromPercentage(grade)
	return expectedValue == result
		? nil
		: "Tests failed - Expected gradeLetterFromPercentage(\(grade)) to be \"\(expectedValue)\" but got \"\(result)\""
}
