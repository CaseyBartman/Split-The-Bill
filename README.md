README:
**Originally a final project for a class, I've decided to take this web application and extend its features
to help learn E2E testing with Cypress in a real world project.**

Below is the table of contents listed as a requirement for the submission of the project.
It provides context to the original purpose of the web application in the context of the Web Development class.


TABLE OF CONTENTS:

This README will consist of the following sections:
1: Explanations on how to load the website 
2: Overview of design philosophy and adjustments from original website
3: Documentation of overall file structure and explanation of different pages

------------------------------------------------------------------------------------------
Section 1: How to load and view the website
1: Clone the repo
2: Navigate to the directory installed by the cloning process
3: In the terminal, run “bundle install” to install gem dependencies
4: CD into “proj6-pals” inside of the cloned repo
5: CD into splitthebill inside of proj6-pals 
6: Run “$ rails db:drop”, then “$ rails db:create” then “$ rails db:migrate”
7: If migration issues arise, run: bin/rails db:migrate RAILS_ENV=development
8: Optionally, you can run “$ rails db:seed” to view sample data setup.
9: In the terminal, run “$ rails server”, and open the site in a new browser
10: This will open you up to the “home” view. Choose to Sign Up, or, you can also sign in using an existing account from the seed data.
11: (If you choose to use the seed data as well, sign in with Email: “caseyemail@gmail.com” and password “123456”)

How to load/run the base tests: *- Note, this section is particularly outdated and unfinished, as this was not for 
                                credit  in the final project itself

1: CD into splitthebill inside of proj6-pals
2: Run the command “$ rails test test/models” 
3: View the text fixtures made for the LIGHT testing in the “/app/test/fixtures/files” folder
4: View the model tests made for testing in the “app/test/models” folder
------------------------------------------------------------------------------------------
Section 2: Documentation of Design Philosophy

This project, as outlined in the requirements, allows individuals to keep track of their expenses across various trips, and allows each person to be paid and pay what they are owed. A user can create an account (login), and then create trips with other existing users. In those trips, users can add expenses and input who covered the bill for the expense, each participants amount that they owe for the bill (such as their share of the bill listed out in the receipt, or one they have per agreement with the others), as well as who has paid their share of the bill and who hasn’t.

If a user hasn’t paid their share of the bill in an expense, that bill will be listed in the “Remaining Unpaid Payments” table (lower down in this expenses screen). There, they can edit the expense, or click a checkbox to mark if they have paid their share. This will update the list of expenses accordingly, and they will be highlighted green in the table if they’ve paid their share for that expense (or, red if they haven’t).

In the expenses table at the top, you can also see a total of how much each individual has spent on the trip, as well as the total cost of the trip on the left. In the individual “owed” expenses table below, you can see a total how much each person still owes towards other members in the trip. 

We also decided to make the expenses part of a trip, rather than its own page, so the user does not have to look at more than one place to find each expense and to have separate trips. This makes it easier by reducing the number of participants to only the ones in the trip. 

In terms of styling, we decided to use built-in bootstrap components for a user-friendly and visually appealing UI. Such components included a navbar to easily switch between different pages, buttons to start various actions, and cards to hold trip or expense information and the forms used to create them. The theme of this application was inspired by the ocean, where the header and footer are beach themed with rich blue color and light grey background. Overall, we made sure to prioritize cleanliness and simplicity. We also have a simple footer which links to each page as an alternative and showcases socials. (OSU Social media).

The application also uses devise for user authentication, where users are able to login and get a view of their trip expenses. This ensures only users are able to view expenses, instead of trips being a gigantic public ledger. In addition, the navbar will react depending on if the current user is logged in or not.  Devise is also integrated with the database, where users are integrated into relational database schema when someone signs up in the application. This allows for a simple and effective way to add and remove users from the schema, and from creating or deleting accounts. 

The app is structured with three entities, the user, expenses, and trips. Each entity can have a relationship, for example, a user can contribute to many expenses, likewise an expense can be contributed to by many users.  A user can join one trip and that trip can have many users itself, etc.

Below is the general outline structure for my models with relationships. For further view of the relational mapping, you can refer to the ER Model and UML Diagram in the presentation slides, which outlines these points with more detail and gives a visual form to the content. 

Models:
-User:
—Has many trips (through participants)
—Has many expenses (through contributions)
—Participates in many expenses directly as a single “Payer” as well

-Participant:
—Tracks which users are part of which trips
—Belongs to a trip
—Belongs to a user

–Trip: 
—Represents a single trip
—Has many expenses (through contributions)
—Has many users (through participants)

-Expense:
—Represents a single expense in a trip
—Belongs to a trip
—Belongs to a payer
—Belongs to multiple participants (through contributions)
—Has many contributions

-Contribution:
—Represents how much each participant contributed to an expense, such as their share of a bill (and how much they owe the person who paid it)
—Belongs to an expense
—Belongs to a user

------------------------------------------------------------------------------------------
Section 3: Overall documentation of file structure

The repo possesses several files and folders of note, housed in the “splitthebill” folder.
This section will explain what the main content includes, including what is going to be shown in each major view. 

Stylesheets:
We have a singular application.scss that holds all the styling for each page. We divided it by each section of the page with comments. 

Controllers:
We have multiple controllers in the application. We have one for each entity including, application (general application), contributions (contributions per person), expenses (expenses in a trip), home (renders home), page (holds terms of service), trips (has information about each individual trip), user (holds users info and creating/deleting users).

JavaScript:
We have a single application.js file which holds an alert for some validations like users checking terms of service.  We also have nested JavaScript in the expenses “_form.html.erb” file to add validations for adding nested contributions, which are generated dynamically inside of the file, hence why the JS is embedded.

Models:
The models are very similar to the database and hold the relations between each entity in the diagram. They possess validation, as shown to be tested in the “app/test/models” folder

Views:
The view holds each view for the page and the general layout html files.

Config:
General configs like routing.

DB:
We have a seeded database with sample data and the schema showcases the database model.

Major Views:

Home: The home page is a simple page which showcases the app with some ratings and reviews from totally real people. It has a link to sign up or sign in. 

Trips: The trips view is a conditional view that either showcases a login link or the trips a user has depending on whether they are logged in. We have expenses nested into the trips as this centralizes those related tasks.

Expenses: Possesses an index view to display every expense a trip contains, as well as information regarding who has yet to pay their share of the bill (to the expense “payer”). The index view is the method in which users can view how to see the expenses and payments they must pay as well. In the “expenses” table at the top, you can see, based on who is highlighted, whether an individual participant has paid their share of an expense. You can add expenses, edit existing ones, and destroy them as well. 

Login/Sign up/ Edit Profile:
These are standard devise generated html pages, that we added css to in order to fit in with the themes. The only addition is to sign up with the terms of service a user must agree to before having their account created. 
