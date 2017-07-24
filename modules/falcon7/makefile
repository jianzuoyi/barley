# This will show 'shift by 273', but we do not mind if the shift changes,
# since it is circular. We just want output to match input with some shift,
# and maybe with reverse-complement.
FC_CFG?=fc_run.cfg

go: run
	${MAKE} test
run:
	fc_run ${FC_CFG} logging.json
test:
	./check.py
cleanall:
	\rm -rf 0-*/ 1-*/ 2-*/ mypwatcher/ *.log run_falcon.sh.e run_falcon.sh.o nohup.out *~
cleanovl:
	\rm -rf 1-*/ 2-*/ mypwatcher/ *.log
cleanasm:
	\rm -rf 2-*/ mypwatcher/ *.log
rerun:
	\mkdir -p versions
	\mv all.log versions/all0.log
	\mv mypwatcher/ versions/mypwatcher0
	\rm run_falcon.sh.e run_falcon.sh.o nohup.out