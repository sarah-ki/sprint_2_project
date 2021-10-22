# README

General Information
---------

* Ruby version: 3.0
* Additional Gems: devise, pg, bootstrap ~> 5.1.0 

* System dependencies: For testing and development Linux (Ubuntu) and Mozilla Firefox were used

* Database creation: For database postgresql is used. The database is called 'luncheon'
and has the following tables:
  - comments with columns:
    - id 
    - name contains a string naming the user who created the comment (later email)
    - body contains text the user/ commentator wrote
    - meal_id integer references the meal the comment belongs to
    - created_at contains datetime information about when the comment was posted
    - updated_at contains datetime information about when the comment was updated
  - groups with columns:
    - id
    - name with a string containing the name of the group
    - description:text
    - created_at:datetime
    - updated_at:datetime
  - meals with columns:
    - id
    - title:string
    - recipe:text
    - user:email of the user
    - due_date:datetime
    - created_at:datetime
    - updated_at:datetime
    - gorup_id:integer
  - tags
    - id
    - name
    - created_at
    - updated_at
  - users
    - id
    - email
    - encrypted_password
    - approved
    - admin
    - created_at
    - updated_at
    - confirmation_token
    - conformed_at
    - conformation_sent_at
    
  Aswell as the joined tables:
        - meal_tag_joins
            - id (own), meal_id(references meal), tag_id(references tag)
        - user_group_joins
            - id (own), user_id(references user), tag_id(references tag)

* How to run the test suite

* Deployment instructions
    the command 'rails s' starts the server on localhost Port 3000

Purpose and Explaination
--------------
    
This Website offers people to join various groups in order to organise their lunch break.


Functional requirements and their Implementation
-------------------------

* CreateReadUpdateDelete (CRUD) eines Wortes/ Wortgruppe mit
  Validierung (maximale Anzahl, Leerzeichen am Anfang und Ende
  entfernen, Uniqueness ...)
        * Tags, Meals and Groups each can be created with different attributes. Among them there are several text and String inputs for words and wordgroups. The word Groups have set max and min lenghts, for some mandatory presence is checked
        * Before saving any input squish is called on each attribute - thats a rails method to remove whitespace at the end/beginning of a string aswell as dublicates inside a text body. 
        * In this type of application titles and inputfields arent always supposed to be unique but there is a validate check for a few that should be in the corresponding model.
* Listendarstellung der angelegten Wörter (mit Paging und Filterung:
  by voting, angelegt am, angelegt von ...)
        * On the Homepage there is a table always showing only Meal Options which are due today
        * For the Listing of all the meals and tags there is paging implemented and the max amount of entrys shown is 10.
* kleine Nutzerverwaltung (Email, Passwort, Confirmation Mails) und Anmeldung anhand von Email und Passwort
        * The Ruby gem 'devise' was used to allow users to create an account as soon as tehy click on sign_up.
        * A logged in user can see his emailaddress in the top left corner of the screen. On click he can destroy or edit his profile
        * The email serves throughout the application as username for e.g. comments
        * If a User is signed up he needs to confirm his email by clicking on teh link that is sent on create by the Mailer before he can use the site
        * A User can only Interact with the Site (Groups, tags, Meals actions or views) when he si signed up
* E-Mail wenn Wort erstellt wurde
        * Again, via the Rails Mailer, every users receives an email once a new meal has been created. On localhost for Testing this was tested with teh rails gem mailcatcher.
* Einträge können gevotet werden
        * Instead of Voting for Words in verbal zombie this websites allows users to join groups
        * + it is calculated how often a tag was used and used within teh application to display some content
* Suche von Einträgen (Autocompletion)
        * There is a search Bar for 'All Meals'. It searches the titles of the meals. Even if the searched item is not full in the title it returns results ('cakes' returns 'pancakes')
* mit Ajax "aufhübschen"
        * When adding a comment the page isnt refreshed but JS is used to only append the new comment to the page
* Admin-Interface zur Nutzerverwaltung (z.B. deaktivieren von Nutzern)
        * /users offers admin users to lock or unlock any user. devise approve was used to implement this feature 
* Statistik-Modul: Klicks, Votes ...
        * How often tags are used is tracked via the Tag Cloud
* Wörter können getaggt werden (mit TagCloud)
        * Tags can be created, edited and deleted aswell as added to meals. 
        * /tags contains the tag Cloud at the bottom of the page

Not functional requirements and their Implementation
------------------------------

* Nutzung eines MVC-Frameworks (Model-View-Controller)
* RESTful
* Test-Driven-Development (TDD)
* Sicherheit (SQL-Injections, XSS, ...)
* Benchmarks
* einigermaßen akzeptables User-Interface (HTML/CSS)
      * bootstrap has been used for multiple views
* gehashte Passwörter (bcrypt2)
      * gem 'devise' was used which automatically encrypts passwords
* Mysql oder PostgreSQL
      * Postgresql Database was used (called luncheon, with multiple tables)

Expenditure of Time
-----------
Konzeption:2h
Einrichtung: 4h
Entwicklung:
Design: 15h
Testing: 8h (Tests schreiben und ausfuehren + Fehler beheben)
Zur Evaluierung der umgesetzten Lösung benötigen wir am Ende die
folgenden Informationen:

* Zeitenerfassung (getrennt nach Tätigkeiten: Konzeption (z.B.: Datenbank-Schema), Entwicklung, Design/HTML )


TODO
-----
- XSS prevention (comment body, group description, group name)
  , format: {with: Devise.email.regexp} for comment name not working
- SQL Injection pRevention
- Tests
- bootstrap for all views
- paging fix when -1 or more than containing articles are accessed
- Clean up of entrys
- Accress for admins fix
- requires login check
- database cleanup
- push to heroku
- push to github
- restful for other components (currently only meals/comments)
- next und previous tauschen
- benchmarks

Fragen
------
- Ist im Model validates format with Devise.email z.B. Xss safe?

- Muss man noch was extra gegen xss machen obwohl rails schon erb utils html escaping nutzt?
- automatisches sql injection testing? wie kann ich die anfrage sehen ohne dass passwort versteckt wird?
- Was muss ich bei devise angeben um sql injection zu testen?
- check for dublicates before creating new in group, meal, tag
