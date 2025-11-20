# Running nf-core CUT&RUN pipeline on ARTEMIS ✂️🏃🏹

Here are the commands in an example walk through with our lab data to run the nf-core cut&RUN pipeline on Artemis
---
1️⃣ Create work directory
let's make a nested directory
```bash
mkdir -p ~/IVR2_test
```

> until I figure out how to upload and download data from command line for Artemis, we're gonna do things a little clunkily
---
2️⃣ Log onto OOD and upload your files to your new directory

First, the necessary fastq.gz files 

*important* always keep them in .gz, this is the necessary input format for the nf-core pipeline
<img width="1115" height="802" alt="image" src="https://github.com/user-attachments/assets/566f26de-659a-49f5-8ebd-6401aae65a43" />

We can verify upload either through the online interface or in the terminal
<img width="1886" height="879" alt="image" src="https://github.com/user-attachments/assets/c931ad64-5f56-4bd9-bc72-7707f159b124" />
---
3️⃣ Let's prepare our sample sheet with the correct file paths

double check the working directory
```bash
pwd #print working directory
```
```bash
out: /mnt/nfs2/gdsc/jf383/IVR2_test
```

for variety, here's an example of uploading the samplesheet directly from my mac terminal 
```bash
scp -i ~/.ssh/artemis \
    /Users/MACUSERNAME/Downloads/samplesheethrc.csv \
    USERNAME@ood.artemis.hrc.sussex.ac.uk:/its/home/USERNAME/IVR2_test/
```
<img width="1005" height="129" alt="image" src="https://github.com/user-attachments/assets/b3551a2d-576b-41b8-83e6-5c73570f3355" />
---

#### Information on how to format the sample sheet is here:
> remeber to upload this also to a directory you can call in the pipeline

https://github.com/joannafernandez/cut-run_for_soutoglou_laboratory/blob/main/how_to_samplesheet.md

---

4️⃣ Let's run our pipleine!

```bash
export NXF_VER=24.10.6
```

let's go back to our home directory, and create our output folder and working directory

```bash
..
mkdir -p ~/IVR2_output
mkdir -p ~/IVR2_work
```

Verify your samplesheet is where you think it is...
```bash
find /its/home/jf383 -name "samplesheethrc.csv"
```

output should be:
```bash
/its/home/jf383/IVR2_test/samplesheethrc.csv
```

And now, run the pipeline!

```bash
nextflow run nf-core/cutandrun \
  -r 3.2.2 \
  -profile singularity \
  -c ~/cutandrun_hpc.config \
  --input  /its/home/jf383/IVR2_test/samplesheethrc.csv \
  --genome hg38 \
  --spikein_genome R64-1-1 \
  --outdir /its/home/jf383/IVR2_output \
  -w      /its/home/jf383/IVR2_work \
  --save_reference \
  --save_trimmed \
  --use_control true \
  --max_memory '64.GB' \
  --max_cpus 14 \
  --dt_calc_all_matrix false
```

<img width="1001" height="916" alt="image" src="https://github.com/user-attachments/assets/89a85a86-c8e0-447e-8b1a-35e86caf689e" />


### This is the generic command which needs to be filled in correctly
```bash
nextflow run nf-core/cutandrun \
  -r 3.2.2 \
  -profile singularity \
  -c ~/cutandrun_hpc.config \
  --input  /its/home/USERNAME/path/to/your_samplesheet.csv \
  --genome hg38 \
  --spikein_genome R64-1-1 \
  --outdir /its/home/USERNAME/path/to/output/dir \
  -w      /its/home/USERNAME/path/to/work/dir \
  --save_reference \
  --save_trimmed \
  --use_control true \
  --max_memory '64.GB' \
  --max_cpus 14 \
  --dt_calc_all_matrix false
```
---

5️⃣ Verify that your pipeline has finished successfully

You should see output like this if the pipeline succesfully ran to completion
<img width="1280" height="500" alt="image" src="https://github.com/user-attachments/assets/b03bd71b-63d2-4cff-90cc-60a7e35046ce" />

✅ You should be able to inspect your output directly either through the terminal, or through Open OnDemand
<img width="668" height="344" alt="image" src="https://github.com/user-attachments/assets/21d9aa11-1ed9-4cb1-989c-8e56cf4c4627" />

<img width="1116" height="860" alt="image" src="https://github.com/user-attachments/assets/03fe7ac1-6220-4609-922a-742778ac262b" />


