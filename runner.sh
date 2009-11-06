#!/bin/bash
if [[ !rvm_loaded_flag ]]; then source ~/.bashrc; fi
rvm use jruby
export NAME=$1
./stamp.rb && open product_stamped.pdf