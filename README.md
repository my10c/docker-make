
# docker-make

Just Makefile to create docker image

## 
How to use it
- 0 edit the file `include/makefile.inc`, set the variables your need
- 1 edit the file `Makefile`, adjust to reflect your need and defined variables from step 0
- 2 edit the `Dockerfile`,  adjust to reflect your need, see logic below

Make commands:
- to build `make build`
- to run `make run`
- to shell into the running image `make shell`
- to cleanup `make clean`

Note:
 You can add other things like `push`, to push the image to a cloud provider or Docker.io -
 Or `save` to save the image

###
Logics
- add your need / app in the Dockerfile but do not run it!
- once the image is created, it runs the `loop` command (zsh script)
- you can then shell into the image and start your app and adjust as needed until it meets your need 
- adjust the Dockerfile again but this time do not run the `loop` script, instead run you app
- debug, adjust repeat until you have your perfect app image

###
Have fun
