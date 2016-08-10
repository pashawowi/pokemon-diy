# Pokémon DIY!
It will be a wonderful DIY project.

## What to do?
Firstly, we are going to make a Pokédex.  
We need to implement a main page (whose URL is /index or /), then the main
Pokédex page (whose URL is /pokedex), and every Pokémon will have its own 
dedicated page (like /pokedex/charmander).

## How to run?
If you are using Intellij to test the project, right click on any file,
and select **Run Play 2 App**, if the dependency download speed is quite slow,
you can use your VPN (make sure it works and Intellij is authorized to use the
network!). And when it succeeds, the default browser will be opened and enjoy
the achievement you've made!  
If you are using command-line interface, make sure activator is in your PATH
environment variable, and then `activator run` for the run and `activator 
clean run` if you want to clean up the running cache (which may be necessary 
if some of the cross-compiling objects need to update, or your output will be
wrong).

## How to let your play application know your database?
You should firstly notice the information in the *application.conf*.  
The username, password, and corresponding database name should be there,
in order to sync, you should run `$ psql -U postgres -d postgres` and enter database
as user **postgres**, and then run
```
postgres=# create role pokemon with login createdb password 'pokemon';
postgres=# create database pokemon;
```
And then you will have a database named 'pokemon', with user 'pokemon' and password 'pokemon'!  

## How to configure your database?
To be done.

## Finally
Happy hacking.