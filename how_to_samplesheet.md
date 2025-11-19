# 🧪🗒 Formatting sample sheets for nf-core CUT&RUN 

This is the most common error point when running the pipeline, so it always worth it to pay attention when formating the sample sheet

Guidelines from the original authors are here: 
> https://nf-co.re/cutandrun/3.2.2/docs/usage/

Here's a few common hiccup points
1. Sample sheets much be in csv format
2. Sample sheets must not contain empty spaces
3. Verify all the file paths (even a missing / will crash the pipeline!)

## Mnimal format
### personal Linux
<img width="918" height="121" alt="image" src="https://github.com/user-attachments/assets/368f6cb7-ac1c-420c-af58-1b3326bc4fa9" />

🟡 Highlighted in yellow is the column names, these **must remain unchanged**

🟢 Highlighted in green are the sample samples, output from the pipeline will be "groupname"_R"replicate"_"filetype..."

🟩 When dealing with multiple replicates, group names must match between replicates

🔵 Highlighted in blue is the path to the read 1 fastq.gz file

🟣 Highlighted in purple is the path to the read 2 fastq.gz file

🟠 Critically, highlighted in orange are the control samples SEACR will when calling peaks.

🔸 Simplified: peaks of signal from the test samples (row 4 and 5) that exceed signal from the control samples (row 2 and 3) are called as peaks we can inspect in the output bedfiles

## Minimal format 
### for HPC, ensure file paths match directory of fastqs on your workspace

<img width="954" height="124" alt="image" src="https://github.com/user-attachments/assets/e48de95e-7cef-4d8b-bb16-ee1ed057ff70" />


## Common errors 
1. If there is an extra space
```bash
sed -i '1s/^\xEF\xBB\xBF//' /its/home/jf383/IVR2_test/samplesheethrc.csv
```
2. If you need to inspect and change something specifically, like removing a specific "," or " "
<img width="1007" height="505" alt="image" src="https://github.com/user-attachments/assets/bd47e144-1a54-4fac-bd66-740630394aed" />
 
```bash
nano /its/home/jf383/IVR2_test/samplesheethrc.csv
```
fix it, then CTRL O, Enter, CTRL X

to print and inspect
```bash
cat /its/home/jf383/IVR2_test/samplesheethrc.csv
```
<img width="996" height="198" alt="image" src="https://github.com/user-attachments/assets/ff880089-6480-4932-b577-f65d266bf8e3" />

