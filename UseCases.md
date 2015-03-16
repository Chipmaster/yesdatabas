# Actors and Goals #

## Actor: User ##
Goals: Login, Setup Account, Edit personal information

## Actor: Administrator ##
Goals: Login, Manage users, generate reports, export to excel/XML, import data, manage data fields, manage display layout

### Use Case List ###
  * Login
  * Setup Account
  * Edit Personal Information
  * Manage Users
  * Generate Reports
  * Export to Excel/XML
  * Import Data
  * Manage Data Fields
  * Manage Display Layout

# Use Cases #
**Use Case: Login**

ID: UC1

Description: Provides authentication for the website.

Precondition: The system displays a login page.

  1. User enters in name and password.
  1. User Press the Login Button.
  1. System determines that user's name and password are valid.
    1. Login the user.
  1. Else
    1. System displays a message to the User.

Postcondition: The user is authenticated.


**Use Case: Setup Account**

ID: UC2

Description: A new user sets up an account and changes their temporary password.

Precondition:
  * Administrator has already added the user with the New User use case.
    * This implies that the User has been emailed with a user name and temporary password.
  * The User has never logged in before.
  * The User has authenticated with the Login Use Case with their temp password.

  1. User enters into the first time setup page
  1. User enters a new password and submits
  1. If the user doesn't enter a new password
    * System continues to prompt for a new password


Postconditions: The user is at the personal information page.


**Use Case: Edit Personal Information**

ID: UC3

Description: Allows users to edit their profiles containing personal information.

Precondition: The system displays a home page.

  1. User clicks "Edit" link.
  1. User is taken to a page where he can edit his profile.
  1. User types data into text boxes/fields.
  1. User clicks "Submit" button.
  1. System stores all data from boxes/fields into database.

Postcondition: The user is taken back to the home page.




**Use Case: Manage Users**

ID: UC4

Description: Allows administrators to create or delete new users.

Precondition: The system displays a home page.

  1. Admin clicks "Manage Users" link.
  1. Admin is taken to a page where he views all current users.
  1. Admin may click "Delete" next to a displayed user.
    1. If so, user is deleted from the database.
  1. Admin may click "Create New User" button.
    1. If so, admin enters an email address of a user.
    1. User is created in system.
  1. Admin clicks "Finish" button.

Postcondition: The admin is taken back to the home page.



**Use Case: Generate Reports**

ID: UC5

Description: Allows admin to view all or some of the user data.

Precondition: The system displays a home page.

  1. Admin clicks "Generate Reports" link.
  1. Admin is taken to a page where he views all user attributes.
    1. Admin selects which attributes he wishes to view.
  1. Admin clicks "View" button.

Postcondition: The admin is taken to a page listing the specified user attributes.



**Use Case: Export**

ID: UC6

Description: Allows admin export data to an Excel or CSV.

Precondition: The system displays a Reports page as a result of Use Case "Generate Reports" (UC5).

  1. Admin clicks "Export" link.
  1. Admin is prompted for a location to save the exported file to.
  1. Ruby library handles exportation.
  1. File is saved to specified location.

Postcondition: The admin is taken back to the home page.



**Use Case: Manage Data Fields**

ID: UC7

Description: Allows admin to add or remove custom data fields.

Precondition: The system displays a home page.

  1. Admin clicks "Manage Custom Data Fields" link.
  1. Admin is taken to a page where he views all custom data fields.
  1. Admin may click "Edit" next to a data field's name.
    1. Data field's name may be edited in a text box.
    1. Admin clicks "Submit" and data field is renamed.
  1. Admin may click "Delete" next to a data field's name.
    1. Custom data field is dropped from the database.
  1. Admin may click "Create New" button.
    1. Creates a name for the field and a type.
    1. Admin clicks "Submit" and custom data field is added to the database

Postcondition: The admin remains on the current page.



**Use Case: Manage Display Layout**

ID: UC8

Description: Allows admin upload a custom CSS file.

Precondition: The system displays a home page.

  1. Admin clicks "Manage Display Layout" button.
  1. A page is displayed containing information about CSS (Cascading Style Sheets)
  1. Admin selects a file from his local machine and clicks the "Upload" button
  1. The CSS is implemented and the website layout changes accordingly.

Postcondition: The admin is taken back to the home page.