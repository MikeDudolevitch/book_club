# README
To run this gem, bundle add book_club and then run bundle install in the command line to install all the app dependencies. 


OPTIONAL: Google Authentication
You will need to create your own Google ID and Secret to utilize google authentication. If you would like to take advantage of this feature complete the following steps:
Visit https://console.cloud.google.com/
Create a New Project
Under the "API & Services" tab, select "OAuth Consent Screen"
Select "External" or "Internal" User type
Fill out the App information (not all fields are necessary)
Move to the "Credentials" tab and select "Create Credentials"
From the dropdown select OAuth Client ID
Select "Web Application"
Under "Authorized redirect URI's" add http://localhost:3000/admins/auth/google_oauth2/callback
You will then see your unique ID and Secret. Create a .env file at the root folder of the application and fill it out as follows:
GOOGLE_KEY=YOUR_KEY_HERE
GOOGLE_SECRET=YOUR_SECRET_HERE


Thank you for using the Book Club web application! This application uses a Ruby on Rails framework to run from front- to back-end. As a user, you can sign in by creating submitting your email, a password, and creating a username, or by signing in using your Google account. Once successfully signed into the app, you have the option to view all existing book clubs that users have created, and once you have selected one, you have the option to join it which will show the virtual meeting link. From the same dropdown bar, you can select a page that shows you all the clubs in which you are a member.
Additionally, you are able to use the 'create club' function create your own club! You can set the club's name, the days for each meetup, and supply a link for virtual meetups. This will also set you as the admin of that club. As admin, you have the ability to set the book the members are going to reading through the 'create book' link. Admins can also update the group's info, or delete it altogether. 
From the dashboard page, you are able to check out what books are being read, and the top 5 most recent book additions in various clubs. 


When finished, simply click the 'logout' button on the top nav-bar.
Thanks for using the Book Club app!
