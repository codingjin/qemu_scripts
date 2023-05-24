#!/bin/bash
STARTMARK="WSTART"
START=($(head result | grep ${STARTMARK}))

while [[ ${START} != ${STARTMARK} ]]; do
	sleep 3
	START=($(head result | grep ${STARTMARK}))
done

tag=($(cat /proc/sys/vm/zone_reclaim_mode))
if [[ ${tag} == "15" ]]; then
	cat /proc/vmstat | grep -E 'pgdemote_file|pgdemote_anon|pgpromote_candidate|pgpromote_candidate_demoted|pgpromote_candidate_anon|pgpromote_candidate_file|pgpromote_tried|pgpromote_file|pgpromote_anon|pgmigrate_success|pgmigrate_fail|pgmigrate_fail_dst_node_full|pgmigrate_fail_numa_isolate|pgmigrate_fail_nomem|pgmigrate_fail_refcount' > pgstat0
	echo "timestamp(s) $(date +%s)" >> pgstat0
fi


