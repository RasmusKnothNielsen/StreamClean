## General construction

- Implement more designpatterns.
  - Something for inheritance, to I don't do the same on several viewcontrollers
  - Delegating responsibilities to specific classes
  - Extendability?

- Make new page to display other streaming choices, such as
  - Music streaming ✓
  - General internet usage (Facebook etc.) ✓
  - Video conferencing ✓

- Find a way to make it easy for the user to input the number of hours and minutes. 
  Is it necessary to get the user to pick single minutes, like 1 hour and 12 minutes? Maybe allow either 15 min/ 30 min  intervals.

## Accounts / Cloud

- Add User signup / Sign in with:
    - Apple 
    - Firebase ✓
    - Facebook ✓

- When signing up with Facebook, find a way to get the email identifier with, when creating the Firebase account, instead of it displaying as "-"

- CRUD Usage
  - Create document with usage in users collection ✓
  - Read specific document in user collection
  - Read all documents in user collection ✓
  - Update document in user collection
  - Delete document in user collection
  - Delete all documents in user collection, deleting the whole collection as a consequence.

- Tell the user that the sign up was successful ✓

## Displaying results
 - Making visuals for the result page
 - add a comparison between the users usage and the average usage of a person, shown in percentage. Example:
   - You used 10% more than the average person this week
   - You used 50% less than the average person this week

 - If user is logged in, and have previous inputs, compare the current usage with the last one, and show the difference. Did the user use more or less? Example:
   - Your streaming usage is 5% higher this week than the last input in week X
  
 - If a non-existing user creates a user after they have done the input; Relocate the document from "John Doe" to their UID folder.


## Facebook
  - Enabling sharing result to Facebook?
  - Enabling a way to challenge friends in consumption?

## Design
- General design of pages and overall design
- Icon design
- Add splash screen

## Miscellaneous
- Consider if a tab bar is a good idea for presenting buttons for history and account information
- Research what the "average user" normally streams and add it, so we can compare user usage and average usage.
- Consider if the user wants to choose the quality of the stream, since 4k streaming is vastly different from 720p
- Implement the logic to calculate the milage used when streaming ✓
- Add soundbit of a woman chanting "shame" while ringing a bell

