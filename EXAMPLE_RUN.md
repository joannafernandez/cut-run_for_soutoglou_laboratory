# 🍏 Cut&RUN Analysis Pipeline — Soutoglou Laboratory
# Example Run

This README includes the bash commands used to run nfcore cut&run analysis pipeline from a personal linux with docker configuration
This **will only work if** docker, nextflow and nfcore/cutandrun -r 3.2.2 are correctly installed as described in SETUP.md

---
## 📚 Documentation for nf-core cutandrun
> ⚠️ it is important to familiariese yourself with all the documentation

- **nf-core pipeline introduction** —
  https://nf-co.re/cutandrun/3.2.2/

- **nf-core cutandrun 3.2.2 usage** —
  https://nf-co.re/cutandrun/3.2.2/docs/usage/

- **nf-core cutandrun 3.2.2 parameters** —
  https://nf-co.re/cutandrun/3.2.2/parameters/

---
## 🛠 Minimal workflow
> 1️⃣ activate conda env
```bash
conda activate nfcore
```

> 2️⃣ clear space for new run
```bash
df -h
rm -rf ~/Desktop/work
nextflow clean -f
docker system prune -a
df -h
```

> 3️⃣ verify no unknown characters in samplesheet.csv
```bash
#copies samplesheet from ssd to home directory
cp /media/bafj7/Jo3/Sonly_samplesheet.csv  ~/samplesheet.csv
head -n 1 ~/samplesheet.csv | hexdump -C
sed -i '1s/^\xEF\xBB\xBF//' ~/samplesheet.csv
head -n 1 ~/samplesheet.csv | hexdump -C
```
> 4️⃣ export necessart paths
```bash
#note that these are exported to external ssd for space optimisation
export TMPDIR=/media/bafj7/jo4/tmp_nf
export NXF_home=/media/bafj7/jo4/nextflow_cache
export _JAVA_OPTIONS=" -Djava.io.tmpdir=/media/bafj7/jo4/tmp_nf"
```
> 5️⃣ run pipeline
ensure that output directory exists before run
```bash
nextflow run nf-core/cutandrun -r 3.2.2 -profile docker \
  --input ~/samplesheet.csv \
  --genome hg38 \
  --spikein_genome R64-1-1 \
  --outdir /media/bafj7/jo4/h3k9samps \
  --work-dir ~/nf_work \
  --save_reference \
  --save_trimmed \
  --use_control true \
  --max_memory '24.GB' \
  --max_cpus 8 \
  --cores 30 \
  -with-report report.html \
  -with-trace trace.txt \
  -with-timeline timeline.html \
  -with-dag dag.png

```

> if running without spike normalisation
```bash
 nextflow run nf-core/cutandrun -r 3.2.2 -profile docker   --input ~/centrodamsheet.csv   --genome hg38   --normalisation_mode CPM   --normalisation_binsize 1   --outdir /media/bafj7/jo5/centrodamnospike   --work-dir ~/nf_work   --save_reference   --save_trimmed   --use_control true   --max_memory '24.GB'   --max_cpus 8   --cores 30   -with-report report.html   -with-trace trace.txt   -with-timeline timeline.html   -with-dag dag.png  --skip_heatmaps  --skip_dt_qc  --skip_peak_qc  --skip_multiqc
```
