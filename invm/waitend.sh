#!/bin/bash
ENDMARK="WEND"
END=($(tail result | grep ${ENDMARK}))

while [[ ${END} != ${ENDMARK} ]]; do
	sleep 5
	END=($(tail result | grep ${ENDMARK}))
done

tag=($(cat /proc/sys/vm/zone_reclaim_mode))
if [[ ${tag} == "15" ]]; then
	cat /proc/vmstat | grep -E 'pgdemote_file|pgdemote_anon|pgpromote_candidate|pgpromote_candidate_demoted|pgpromote_candidate_anon|pgpromote_candidate_file|pgpromote_tried|pgpromote_file|pgpromote_anon|pgmigrate_success|pgmigrate_fail|pgmigrate_fail_dst_node_full|pgmigrate_fail_numa_isolate|pgmigrate_fail_nomem|pgmigrate_fail_refcount' > pgstat1
	echo "timestamp(s) $(date +%s)" >> pgstat1

	# get the delta pgstat
	PGSTAT0="pgstat0"
	PGSTAT1="pgstat1"
	PGSTAT="pgstat"

	if ! [[ -f ${PGSTAT0} ]]; then
		echo "${PGSTAT0} is missing"
		exit
	fi
	if ! [[ -f ${PGSTAT1} ]]; then
		echo "${PGSTAT1} is missing"
		exit
	fi
	WCL0=($(wc -l ${PGSTAT0}))
	WCL1=($(wc -l ${PGSTAT1}))
	if [[ ${WCL0} != ${WCL1} ]]; then
		echo "WCL0=${WCL0} != WCL1=${WCL1}"
		exit
	fi

	KEY=($(cat ${PGSTAT0} | cut -d' ' -f1))
	V1=($(cat ${PGSTAT0} | cut -d' ' -f2))
	V2=($(cat ${PGSTAT1} | cut -d' ' -f2))
	for ((i=0; i<${#KEY[@]}; i++)); do
		echo "${KEY[${i}]} $((${V2[${i}]} - ${V1[${i}]}))" >> ${PGSTAT}

		if [[ ${KEY[${i}]} == "pgmigrate_success" ]]; then
			pgmigrate_success=$((${V2[${i}]} - ${V1[${i}]}))
		elif [[ ${KEY[${i}]} == "timestamp(s)" ]]; then
			timestamp=$((${V2[${i}]} - ${V1[${i}]}))
		elif [[ ${KEY[${i}]} == "pgdemote_file" ]]; then
			demote_file=$((${V2[${i}]} - ${V1[${i}]}))
		elif [[ ${KEY[${i}]} == "pgdemote_anon" ]]; then
			demote_anon=$((${V2[${i}]} - ${V1[${i}]}))
		elif [[ ${KEY[${i}]} == "pgpromote_candidate_demoted" ]]; then
			promote_candidate_demoted=$((${V2[${i}]} - ${V1[${i}]}))
		fi
	done
	ncores=($(nproc))
	pgmigrate_bandwidth=($(echo "${pgmigrate_success}/${timestamp}" | bc -l))
	pgmigrate_bandwidth_core=($(echo "${pgmigrate_success}/${timestamp}/${ncores}" | bc -l))
	echo "pgmigrate_bandwidth(#pages/s) ${pgmigrate_bandwidth}" >> ${PGSTAT}
	echo "pgmigrate_bandwidth_core(#pages/s) ${pgmigrate_bandwidth_core}" >> ${PGSTAT}
	demote_total=$((${demote_file}+${demote_anon}))
	if [ ${demote_total} -ne 0 ]; then
		thrashing_rate=($(echo "scale=2; (${promote_candidate_demoted})*100/(${demote_total})" | bc -l))
	else
		thrashing_rate=0
	fi
	echo "thrashing_rate ${thrashing_rate}%" >> ${PGSTAT}

fi


