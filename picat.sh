#!/usr/bin/env bash
fzn_picat_dir=$(dirname "$0")
exec "$fzn_picat_dir/Picat/picat" -path $fzn_picat_dir fzn_picat_sat.pi $@
