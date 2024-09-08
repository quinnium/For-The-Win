## Technical Test 'take home' project.

This is a simple app that displays lottery draw results from mock data, alongside a randomly generated lottery ticket revealing any matching winning numbers

### Approach
- It was decided to attempt to tackle *all* requirements of the task, including persistent storage
- MVVM was chosen as the architecture, as I am most familiar with it
- Because it was the aim to introduce a *swipeable* view of Draws (such that a user can swipe left/right to switch between Draws), it was decided not to use the traditional NavigationStack format, as it would not feel natural for a user to navigate to a specific draw within sub-level in the stack (being 'pushed' from the right) and then swipe between draws. So an overlay was used instead.

### Technologies Used
- Because iOS16 needed to be supported, Realm was used as a database framework (iOS16 does not support SwiftData, and Realm handles arrays in a slightly more straight forward way than Core Data
- SwiftUI was used as it was both stipulated by the instructions, and also personally preferred.
- 'async/await' was used for the primary concurrency option (as opposed to Combine, or use of closures) as it provide for a much cleaner & more logical code base, with less nesting/indentations required

### With more time...
- Further refactoring and simplification of the Views for better understanding
- Further optimisation for varying screen sizes would be implemented (some of the frame dimensions are currently set as a fixed CGFloat (which is not ideal), whereas they need to be adaptable for different sizes / screen ratios)
- Accessibility features would have been implemented for the DrawDetailView (I had found this to be problematic in my own attempts)

### How to run the application
- Requirements
  - Swift 5.5 or later
  - iOS 16.0 or later
  - Xcode 15.0 or later
- Dependencies
  - RealmSwift https://github.com/realm/realm-swift has been used as a package dependency via Swift Package Manager
  - No additional setup is required as Xcode will automatically download dependencies
- Running
  - Download or clone the project from Github
  - To run the project, open it in Xcode and run it in a simulator, or on a connected physical device
