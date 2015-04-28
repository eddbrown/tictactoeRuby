# tictactoeRuby
A simple tic tac toe app in ruby.

The back end is well tested. It started off with much more classes than there currently are. I decided after a while that there was a lot of redundancy in the code, hence why there are now only 2 classes. The board and the victory checker. 

The purpose of the project was to try to gain more practice with back end ruby. However it evolved into learning how to pass information from the back end to the front using JSON objects.

If you look at the app, the server creates a JSON object with the front end reads using AJAX and uses to update the main page.

To have made the project less buggy and of higher quality, there should have been front end testing, but I was really just trying to work out how to pass the information to the front end. Indeed, I made a point of trying to not use the erb function of the markup, although in some cases, erb was by far the easiest way to communicate to the back end from the front.
