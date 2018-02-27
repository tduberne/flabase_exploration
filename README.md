Exploration of FlaBase Flamenco Knowledge Base
==============================================

This repository contains code to analyse the FlaBase
flamenco knowledge base: <https://www.upf.edu/web/mtg/flabase>

The Makefile is written in a way that the data should be downloaded
automatically, but this does not work at the moment (feb. 2018): data needs
to be obtained from the authors.

Structure
=========

The structure is inspired by the cookiecutter project for data science.

Data is organized in 3 directories:

- data/00_original, containing data as it was downloaded from original sources
- data/01_interim, containing transformations of the datasets that are more convenient for analysis
- data/02_final, containing final outputs, if any

Python code is separated in two directories:

- python/, that contains the python "library" files
- notebooks/, containing Jupyter notebooks. Output is stripped using nbstripout,
	which needs to be installed (<https://github.com/kynan/nbstripout>)

In case anything interesting comes out,
there could also be additional directories,
for instance containing "final" notebooks (where output would not be stripped
before commit).

The whole pipeline is configured through a Makefile.
Simply typing make should run the whole process.

Interesting Questions
=====================

Here is a random list of questions I want to explore using the dataset:

* [ ] How does the collaboration network of flamenco artists look like?
	Is there homophily (for instance by gypsy/payo) or geographical features?
	How did this change over time?
* [ ] What trends can be observed in terms of popularity of Palos
