#!/usr/bin/env bash

set -e  # stop execution in case of errors

sudo apt-get update && sudo apt-get install -qq libgsl0-dev  openmpi-bin libopenmpi-dev
pip install -r requirements.txt
pip install coverage coveralls
pip install nose-testconfig
if [ "$TRAVIS_PYTHON_VERSION" != "3.3" ]; then
    pip install setuptools>=20.5
fi
source ci/install_brian.sh
source ci/install_nest.sh
source ci/install_neuron.sh
python setup.py install
