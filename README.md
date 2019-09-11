
Since the debate came up , e.g. here https://gist.github.com/markusfisch/2648733 ,
and i there was no stock od , i modded markus fisch's implementation to work with my ash;


benchmarks were done with:
 >> time /bin/ash -c "(grep -e machine -e system /proc/cpuinfo;ash benchmark.sh 2>&1 ) &> /tmp/base64bench.log"

but matezusa's implementation died even on a 1mb partition with out of memory


