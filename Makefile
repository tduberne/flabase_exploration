# Python paths
VENV_DIR = venv/
PIP = $(VENV_DIR)/bin/pip
PYTHON = $(VENV_DIR)/bin/python3
JUPYTER = $(VENV_DIR)/bin/jupyter
RUN_NOTEBOOK = $(JUPYTER) nbconvert --inplace --to notebook --execute

.PHONY: cleaned_data setup rm_cleaned_data

cleaned_data: data/00_original/flabase-json/.stamp
	echo all cleaned data was made

######################################################################################
# Setup environment
######################################################################################

targets/venv: | targets/
	virtualenv -p python3.5 $(VENV_DIR)
	touch targets/venv
	
setup: FORCE
	venv/bin/pip install -r requirements.txt
	venv/bin/pip install -e python/

rm_cleaned_data:
	rm data/01_cleaned/*

requirements.txt: FORCE
	$(PIP) freeze | grep -v '^-e ' > requirements.txt

######################################################################################
# Get 'raw' data
######################################################################################

# As of now, fails with 403, but e-mail exchange with author of the data lets think it
# should be  fixed in a near future.
# For now, zip file needs to be gotten by the author and saved there by hand
#
# Separate zipfile download and its extraction for this reason
data/00_original/flabase-json.zip: | data/00_original/
	cd data/00_original &&\
	wget http://mtg.upf.edu/descargas/system/files/flabase-json_0.zip flabase-json.zip

# somehow directory as a target is buggy: ALWAYS rebuilt
data/00_original/flabase-json/.stamp: data/00_original/flabase-json.zip
	cd data/00_original &&\
	unzip flabase-json.zip &&\
	rm -r __MACOSX
	touch $@

######################################################################################
# Data munging scripts
######################################################################################


######################################################################################
# Data munging notebooks
#
# The idea here is that I use notebooks anyway to design the munging, so why convert to
# a script? I can see pros and cons to both approaches, so let's see how this plays out.
######################################################################################


######################################################################################
# Analysis scripts
######################################################################################


######################################################################################
# Analysis notebooks
######################################################################################


######################################################################################
# Technical
######################################################################################
FORCE:

targets/:
	mkdir $@

logs/:
	mkdir $@

data/:
	mkdir $@

data/00_original/: | data/
	mkdir $@

data/01_interim/: | data/
	mkdir $@
