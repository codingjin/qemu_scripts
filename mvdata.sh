#!/bin/bash

workload="pr_base"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10 5 0; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="pr_tpp"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10 5; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done


<<comment
workload="bfs_base"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10 5 0; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="bfs_tpp"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done
comment

<<comment
workload="cc_base"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10 5 0; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="cc_tpp"
targetdir="data520"
for LOCALMEMSZ in 40 35 30 25 20 15 10 5; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done
comment

<<comment
workload="sssp_base"
targetdir="data520"
for LOCALMEMSZ in 0 50; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/sssp32/${workload}/${LOCALMEMSZ}/
done

workload="sssp_tpp"
for LOCALMEMSZ in 50; do
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/sssp32/${workload}/${LOCALMEMSZ}/
done
comment

<<comment
workload="sssp_base"
targetdir="evaluation_data.517"

for i in {0..12}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="sssp_tpp"

for i in {2..12}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done
comment
<<comment
workload="tc_base"
targetdir="evaluation_data.517"
mv VM_data/${workload} ${targetdir}/
for i in {0..8}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="tc_tpp"
mv VM_data/${workload} ${targetdir}/
for i in {1..8}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done
comment

<<comment
workload="bc_base"
targetdir="evaluation_data.517"
mv VM_data/${workload} ${targetdir}/
for i in {0..8}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done

workload="bc_tpp"
mv VM_data/${workload} ${targetdir}/
for i in {1..8}; do
	LOCALMEMSZ=$((i*5))
	cp BW/${workload}/${LOCALMEMSZ}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/
done
comment

<<comment
workload="ycsb_tpp"
targetdir="data520"
for LOCALMEMSZ in 30; do
	for i in {1..10}; do
		cp BW/${workload}/${LOCALMEMSZ}/${i}/MBW* ${targetdir}/${workload}/${LOCALMEMSZ}/${i}/
	done
done
comment




