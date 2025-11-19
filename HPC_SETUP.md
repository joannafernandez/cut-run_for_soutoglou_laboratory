# 🏹 Setting up the Cut&RUN Analysis Pipeline for the Soutoglou Laboratory on *ARTEMIS* 
## UoS HRC

This README includes the required software, installation steps, and pipeline commands used for Cut&RUN NGS library analysis in the Soutoglou Laboratory.

Please note this .md describes configuration for _the Artmeis HRC_, which requires access to be granted by UoS ITS
Importantly! Windows CL commands may vary to the below, which work on Warp for MacOS

---

## 📄 Documentation 
- **ARTEMIS** - Hybrid Research Cluster Documentation

  https://artemis-docs.hpc.sussex.ac.uk/artemis/index.html

- **Nextflow** — Workflow management  
  https://www.nextflow.io/docs/latest/overview.html

- **Singularity** — Containerization (for HPC Linux usage)  
  https://docs.sylabs.io/guides/3.5/user-guide/introduction.html

---

## 🔑 Access to Artermis

1. Access to the HRC must be requested ahead of set up.
2. Follow instructions here https://artemis-docs.hpc.sussex.ac.uk/artemis/access.html
3. After logging into OOD, create an SSH key and upload to Artemis

This process appears to be more difficult for Windows compared to MacOS, here are the commands I ran in my Warp terminal on my personal Mac

🛠 ssh setup
```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/artemis
ssh-copy-id -i ~/.ssh/artemis.pub USERNAME@ood.artemis.hrc.sussex.ac.uk
```
If it is the first time setting up, you will be prompted to continue connection, enter _yes_

✅ Test login

```bash
ssh -i ~/.ssh/artemis USERNAME@ood.artemis.hrc.sussex.ac.uk
```

---

## ✨ Installing NextFlow

1️⃣ Check java version
```bash
java -version
```
should return Java 17, which is what we need

2️⃣ Run commands in the HPC login node
```bash
cd $HOME
mkdir -p bin
cd bin

curl -s https://get.nextflow.io | bash
chmod +x nextflow

#you can verify installation into correct directories by ls -l anytime
```

3️⃣ Edit the ~/.bashrc
```bash
nano ~/.bashrc
# Add my personal bin directory to PATH at the bottom of the file
export PATH="$HOME/bin:$PATH"
```
4️⃣ Save and exit: Ctrl+O, Enter, Ctrl+X
Then reload
```bash
source ~/.bashrc
```
5️⃣ Verify installation
```bash
which nextflow
nextflow -version
```

---
## ✨ Installing Singularity/Apptainer

1️⃣ Try
```bash
module spider singularity
module spider apptainer
```
> if its there, ( should be "apptainer version 1.3.5-1.el9"), load the module and check

```bash
module load singularity
```

2️⃣ Create necessary directories
UoS HRC does not have a "project" directory, so since I'm setting this up for myself, I'll make my own directory in ./home. 

> This might be something to look into in future, I can approach ITS to create a ./project directory for us if necessary

```bash
mkdir -p /its/home/USERNAME/.singularity/cache
```
```bash
mkdir -p ~/nf_work
```
```bash
mkdir -p ~/cutandrun_test_output
```
3️⃣ Create at specific Nextflow config file fo Artemis

```bash
nano ~/cutandrun_hpc.config
```

Paste this:
```bash
singularity {
    enabled = true
    cacheDir = "$HOME/.singularity/cache"
}

process {
    executor = 'slurm'

    // Default partition and resources
    queue  = 'general'      // or 'long' if you prefer long-running jobs
    cpus   = 4
    memory = '16 GB'
    time   = '4h'           // default per-process, safely < 8h limit

    // Optional: override TRIMGALORE specifically (usually quick)
    withName: 'NFCORE_CUTANDRUN:CUTANDRUN:FASTQC_TRIMGALORE:TRIMGALORE.*' {
        time = '2h'         // very safe for general partition
    }
}

// Global nf-core limits – must respect partition limits
params {
    max_memory = '64.GB'
    max_cpus   = 16
    max_time   = '8.h'      // NEVER more than 8h on 'general'
}


```
Save and exit (Ctrl+O, Enter, Ctrl+X).

---

## 🧩 Running the nf-core test
make sure that we export to use a version of nf-core that is compatible with nf-core/cutandrun 3.2.2.

```bash
cd ~   # or wherever you like to run things

# Tell the launcher which NF version to use
export NXF_VER=24.10.6   # good stable version before the known incompatibility band

# sanity check
nextflow -version
```

Now, run the test!
```bash
nextflow run nf-core/cutandrun \
    -profile test,singularity \
    --outdir /its/home/jf383/cutandrun_test_output_nxf24106 \
    -w /mnt/nfs2/gdsc/jf383/work
```

> caveat! ChatGPT 5.0 suggests setting specific folders for output:
```bash
nextflow run nf-core/cutandrun \
  -profile test,singularity \
  -c ~/cutandrun_hpc.config \
  --outdir ~/cutandrun_test_output \
  -w ~/nf_work/test_run
```
> and real runs should have 
```bash
  -w ~/nf_work/run1
```

---

if successful (if it looks a bit like this:)
<img width="1065" height="624" alt="image" src="https://github.com/user-attachments/assets/937bb80e-4593-4783-bf06-6df8fc9adb1b" />

You should them be able to navigate to the folder with the Artemis Open OnDemand web interface and inspect the outputs
<img width="1491" height="867" alt="image" src="https://github.com/user-attachments/assets/96629e0c-5d7f-453a-8177-1dfdaa72c4bd" />
<img width="1488" height="883" alt="image" src="https://github.com/user-attachments/assets/0bc231e6-d53d-45aa-9af9-1c91139bb41a" />


