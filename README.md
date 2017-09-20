![Picture](http://static1.squarespace.com/static/57b77304b3db2bfb203fbf3f/t/581e02ade4fcb51e9e0bc4cd/1501254745108/?format=1500w)

# Hiring Assessment Application

* A hiring assessment application to determine whether an applicant is suitable for working remotely and fulfilling a strategy consultant role.

## Table of Contents

1. [Getting Started](#a)
    1. [Installing Atom text editor](#b)

        * [Windows / Linux Installation Instructions](#c)

          * [Accessing the Terminal](#d)

        * [Installing Ruby on Rails](#e)

2. [Viewing this Application](#f)

    1. [Clone down this application locally](#g)

    3. [Take the application live](#h)

3. [Editing this Application](#i)

4. [Uploading your project with Heroku](#j)

## Prerequisites
* Rails
* PostgreSQL

## Technologies Used
* HTML/CSS
* Ruby
* Rails
* PostgreSQL

# <a name="a"></a>Getting Started

## <a name="b"></a> Installing Atom

### Atom

Atom was designed with the developer in mind by adding features and customization that help developers write their code more productively.

* Download the installer for your operating system here: https://atom.io/

## <a name="c"></a> Windows / Linux Installation Instructions

* <a name="d"></a> Accessing the Terminal

### Windows Setup

Windows uses a Terminal program as well, but a Terminal with all the capabilities we'll require is not installed by default.

There are many options available, but we recommend using a terminal program called git bash. You can download this free program at https://git-for-windows.github.io/.

## <a name="e"></a> Installing Ruby on Rails

On Windows, the easiest way to install Ruby is with the RailsInstaller, which includes Ruby and a few other tools. Go to this page: http://railsinstaller.org/en and install ruby 2.3 for windows.

## <a name="f"></a> Installing PostgresSQL

### Windows Setup

1. Download and install postgres here: https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows.

2. Keep all of the default options and use a password that you will remember, you're going to need this soon.

3. Change environment variables such that Path (for system, not user) is: `C:\Program Files\PostgreSQL\9.0\bin`

![Picture](https://puu.sh/xt9V4/340431493d.png)

![Picture](https://puu.sh/xtdvD/f0b593a7fb.png)

Don't forget to change access rights to folder `PostgreSQL\9.0` and remove any default readonly rights on the folder or content. (You may also need to restart your computer for these to take effect)

![Picture](https://puu.sh/xta8T/8eb86d0999.png)

4. Test Postgres installation by trying to create a new database: From command line: createdb -U postgres mydb_as_postgres. You should be prompted to enter the password now, if you're not it may be that you need to start the server first. The easiest way is through pgAdmin IV, which should be 'pgAdmin4.exe' in a folder somewhere like C:\Program Files\PostgreSQL\9.0\bin. Once you've started pgAdmin IV there should be a panel on the left called 'Object Browser'.

![Picture](https://puu.sh/xt9Od/9f90d76956.png)

In this there should be a tree with:

Server Groups > Servers > PostgreSQL 9.0 (localhost:5432)

Right click on 'PostgreSQL 9.0 (localhost:5432)' and select 'Connect'.

The createdb -U postgres mydb_as_postgres command should create a new databse called 'mydb_as_postgres' which you can check by firing up pgAdmin III and double clicking on 'PostgreSQL 9.0 (localhost:5432)'. Under this there should be:

`Databases (2)` which should list 2 databases called mydb_as_postgres and postgres

I called it `_as_postgres` because the -U postgres part of the command tells Postgres to create the database with the postgres user as it's owner, which you need to specify when you're not signed in as the postgres user. I have all of my files stored as 'Aaron' user though so if you're the same and want to keep developing your app when signed in as a different user you need to create a Postgres 'role' for that user now (see step 5).

5. Through pgAdmin III. Right-click on Login Roles (which for me is in):

Object Browser > Server Groups > Servers > PostgreSQL 9.0 (localhost:5432) > Login Roles

Right-click on Login Roles and select 'New Login Role...' in Role name, put in your operating system user name, which for me is Aaron, and fill in your password under the 'Role Privileges' tab. Then check all the boxes including 'Superuser' and 'Can create roles'.

![Picture](https://puu.sh/xtamM/6875701447.png)

![Picture](https://puu.sh/xtapD/47c0979ee9.png)

![Picture](https://puu.sh/xtarb/d7dbde6638.png)

6. You should now be able to create a new database without being signed in as the postgres user. Try typing:

`created database mydb_as_user;`

![Picture](https://puu.sh/xtdkE/24d65c6a4d.png)

- - - -

# <a name="o"></a> Viewing the application

## Setup Requirements

1. Clone the directory to your local machine.

![Picture](https://puu.sh/xtene/a7a7a43b05.png)

![Picture](https://puu.sh/xteyT/b631463235.png)

2. Navigate to project root directory.

>> cd Artemis

![Picture](https://puu.sh/xteJ2/9d461363f3.png)

3. Run $ bundle to install necessary gems.
4. Run $ rails db:create and $ rails db:migrate to initialize the database. Run $ rails db:migrate RAILS_ENV=test to enable rspec tests.
5. Run $ rails db:seed to populate the database with data.
6. Run $ rails server to start the app. Navigate to 'localhost:3000' in your browser.

- - - -

# <a name="i"></a> Editing the Application

* Make sure you're in the project folder in your terminal

* Open the application in your Atom text editor with the following command:

> $ atom .

>> Note that there is a period following the atom command. This is telling the terminal to open all of the files in your current directory under atom.

* Navigate to the `db` folder in the project directory, then select the file `seeds.rb`

![Picture](https://puu.sh/xteTS/89be496905.png)

* You'll see a method called `make_questions`

![Picture](https://puu.sh/xtfqT/43a3faeb04.png)

* This contains the questions and their related section number

* Further down you'll see the text for quiz answers and their value

![Picture](https://puu.sh/xtfE9/cacbb89e79.png)

* Make the necessary changes, <kbd>CTRL</kbd>+<kbd>S</kbd> to save and `rails s` in your terminal. To see the changes locally on your browser at 'localhost:3000'

- - - -

# <a name="j"></a> Uploading your project with Heroku

* Create an account at https://www.heroku.com/
* Open a terminal or command prompt.
* When you start working on a new computer, generate a new pair of SSH keys by typing $ ssh-keygen -t rsa -C your_email@address.com. Press enter without typing anything when it prompts you for the file and for the passphrase. If it prompts you to overwrite the existing keys, say yes.
* Run $ heroku login and enter your Heroku credentials when prompted.
* Run $ heroku keys:add to add the SSH keys for this machine to your Heroku account.
* Navigate to the project directory in your terminal.
* Set up your Heroku app.
- If you haven't created a Heroku app yet, run $ heroku create your_app_name.
- If you have already created a Heroku app for this project, run $ heroku git:remote -a your_app_name to add a Git remote called heroku that points to your Heroku app. In this case it will artemisproject191117
* Push your code to Heroku with $ git push heroku master and if necessary, migrate your database using `heroku run rake db:migrate` and `heroku run rake db:seed` if you need to seed the database.
* When you're done with the machine, remove your SSH keys from Heroku with $ heroku keys:remove your_email@address.com, delete them from the computer with `$ rm ~/.ssh/*`, and log out of Heroku with $ heroku logout.
If you get the error Permission denied (publickey), run $ rm ~/.ssh/* to clear the SSH settings off the machine, and then try again starting with step 1.
