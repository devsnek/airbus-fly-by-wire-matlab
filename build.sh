#!/bin/bash

# https://github.com/mathworks/matlab-circleci-orb/blob/master/src/commands/install.yml

set -ex

# install core system dependencies
wget -qO- --retry-connrefused https://ssd.mathworks.com/supportfiles/ci/matlab-deps/v0/install.sh | sudo -E bash -s

# install ephemeral version of MATLAB
wget -qO- --retry-connrefused https://ssd.mathworks.com/supportfiles/ci/ephemeral-matlab/v0/ci-install.sh | sudo -E bash -s

# build
matlab -batch "run('scripts/prepare.m');"
matlab -batch "run('scripts/generate.m');"
