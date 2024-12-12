#!/usr/bin/env bash

v_maj="3"
v_min="5"
picat="picat${v_maj}${v_min}_linux64"

if [[ ! -d 'Picat' ]]; then
	wget http://picat-lang.org/download/$picat.tar.gz
	tar -xf $picat.tar.gz
	rm $picat.tar.gz
fi

# tests
minizinc --solver ./picat.msc langford.mzn -D 'n=3;m=2;' # solve
minizinc -c --solver ./picat.msc langford.mzn -D 'n=3;m=2;' --fzn langford.fzn # compile to fzn
./Picat/picat ./bin/Picat/fzn_picat/fzn_picat_sat.pi -e langford.dimacs langford.fzn # compile fzn to dimacs
