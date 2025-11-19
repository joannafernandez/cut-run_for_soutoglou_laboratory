# Running CNR on ARTEMIS 

Here are the commands in an example walk through with our lab data to run the nf-core cut&RUN pipeline on Artemis

1️⃣ Create work directory
let's make a nested directory
```bash
mkdir -p ~/IVR2_test
```

> until I figure out how to upload and download data from command line for Artemis, we're gonna do things a little clunkily

2️⃣ Log onto OOD and upload your files to your new directory

First, the necessary fastq.gz files 

*important* always keep them in .gz, this is the necessary input format for the nf-core pipeline
<img width="1115" height="802" alt="image" src="https://github.com/user-attachments/assets/566f26de-659a-49f5-8ebd-6401aae65a43" />

We can verify upload either through the online interface or in the terminal
<img width="1886" height="879" alt="image" src="https://github.com/user-attachments/assets/c931ad64-5f56-4bd9-bc72-7707f159b124" />

3️⃣ Let's prepare our sample sheet with the correct file paths

double check the working directory
```bash
pwd #print working directory
```
```bash
out: /mnt/nfs2/gdsc/jf383/IVR2_test
```
### Information on how to format the sample sheet can be found in .md

