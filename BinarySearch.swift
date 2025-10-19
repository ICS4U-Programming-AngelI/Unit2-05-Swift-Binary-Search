import Foundation // Import Foundation for random numbers and user input

// Function to perform binary search on a sorted array
func binarySearch(arr: [Int], target: Int) -> Int {
    var low = 0  // Start index of the search range
    var high = arr.count - 1 // End index of the search range
    var index = -1// index if number is not found
    
    // Continue searching while the range is valid
    while low <= high {
        let midpoint = (low + high) / 2 // Find the midpoint index
        
        // If target is smaller than the midpoint value
        if target < arr[midpoint] {
            high = midpoint - 1 // Move the search to the left side
        }
        // If target is larger than the midpoint value
        else if target > arr[midpoint] {
            low = midpoint + 1 // Move the search to the right side
        }
        // If target is equal to the midpoint value
        else {
            index = midpoint// Save the index where it was found
            break // Exit the loop since number is found
        }
    }
    return index // Return the index (-1 if not found)
}

// Main program starts here
while true { // Keep looping until user quits
    var numbers = [Int]() // Empty array to store 10 numbers
    
    // Generate 10 random numbers between 0 and 100
    for i in 0...9 {// Loop from 0 to 9 (10 times)
    // Generate random number
        let randomNumber = Int.random(in: 0...100)// Generate random number
        numbers.append(randomNumber)// Add the number to the array
    }
    
    numbers.sort()// Sort the array in ascending order
    
    // Display the array
    print("") // Add a blank line for clarity
    print("What number are you searching for in the list below? Enter \"q\" to quit.")
    for i in 0...9 { // Loop through sorted array         
        // Print each number with space.
        print(numbers[i], terminator: " ")
    }
    print("") // Print a newline after numbers
    
    // Ask the user for input
    print("Number:")
    let userInput = readLine() // Read user input as a string
    
    // Check if input exists
    if let actualInput = userInput {
        // Convert input to lowercase
        let lower = actualInput.lowercased()
        
        if lower == "q" {  // If user types 'q'
            print("Thank you for playing!") 
            break // Exit the loop
        } 
        // Try to convert input to integer
        else if let target = Int(actualInput) {
            // Call binary search
            let index = binarySearch(arr: numbers, target: target) // Call binary search
            
            if index != -1 { // If number is found
                print("The number \(target) is found at index \(index).")
            } else {  // If number is not found
                print("The number \(target) is not found in the list of numbers.")
            }
        } else { // If input is invalid (not a number)
            print("Invalid input. Please enter a number or \"q\" to quit.")
        }
    } else {  // If no input is given
        print("No input received.")
    }
}
