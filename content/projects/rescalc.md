---
title: ResCalc
---

{{< project rescalc >}}

ResCalc is a Python Script and Library for easily calculating your university results.

## How to use?

ResCalc stores data in YAML files, which can then be stored in a git repo to nicely back everything up.

There are examples of the YAML files in the `example` folder.

An example command for the script is `./rescalc.py example info`, where the first parameter is the location of the data folder and the second is the command.

## How to install?

This software uses Pipenv, a wonderful alternative to / wrapper around pip.

You can install Pipenv by running `pip3 install pipenv`.

Install the requirements `pipenv install`.

Start the virtualenv `pipenv shell`.

You can now use the cli tool.

## Use as a library

You can use the `reslib` module as a library if you would like. It requires PyYAML.

## Requirements

* Python 3
* PyYAML (+ LibYAML if you like speed)
* A computer
 
## Feature Roadmap

I wouldn't currently describe ResCalc as complete, there are many things I want to add.

* A better command line tool
* Write to the data files, in addition to reading
* Neater code (Not that it isn't currently :P)
* A web interface

## Licence

ResCalc is licenced under the MIT Licence, see the `LICENSE` file.
