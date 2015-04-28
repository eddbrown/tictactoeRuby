# Tic Tac Toe in Ruby
.. image:: https://codeclimate.com/repos/553fa4fe69568070a4004c92/badges/a39bfebb54285bcdb50e/coverage.svg
   :target: https://codeclimate.com/repos/553fa4fe69568070a4004c92/feed
   :alt: Test Coverage
   
A simple tic tac toe app in ruby. Created to practice OOD principles, which if you look at the classes has been well implemented. Interaction with the other classes was stubbed out for testing. The classes also run on their own.

The purpose of the project was to try to gain more practice with back end ruby. However it evolved into learning how to pass information from the back end to the front using JSON objects. If you look at the app, the server creates a JSON object which the front end reads using AJAX and uses to update the main page.

Sinatra was used to get the server running, chosen because it is so lightweight.

The back end is well tested. It started off with much more classes than there currently are. I decided after a while that there was a lot of redundancy in the code. The classes were stripped down immensely, especially the player class. I realised that the complication of having two players was completely unnecessary. The app is supposed to be played on one page, so having a second player class makes no sense if we just have one player class placing alternating pieces.

I am quite proud of the victory checker class, however I am sure there is a neater way of structuring it.

To have made the project less buggy and of higher quality, there should have been front end testing, but I was really just trying to work out how to pass the information to the front end. Indeed, I made a point of trying to not use the erb function of the markup, although in some cases, erb was by far the easiest way to communicate to the back end from the front.

## Gemfile
The Gems required are: 
- rspec
- sinatra
- json

Any suggestions on how to further it and to give me *much needed* advice on better principles is very welcome!
