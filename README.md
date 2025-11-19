# ✂️🏃‍♂️ Cut&RUN Analysis Pipeline — Soutoglou Laboratory 
Using nf-core cutandrun v 3.2.2 🧬🍏 
https://github.com/nf-core/cutandrun
> The nf-core framework for community-curated bioinformatics pipelines.
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
> Nat Biotechnol. 2020 Feb 13. doi: 10.1038/s41587-020-0439-x.

> disclaimer: Portions of this analysis were developed with assistance from ChatGPT (GPT-5 & GPT-4), a large language model created by OpenAI.
Model: ChatGPT (GPT-5 & GPT-4). Accessed: June 2025.

_Please note there are instructions here for running the pipeline on a **personal linux** as well as the **HPC/HRC at Sussex**_

---
### Cut&RUN libraries were generated as described here:
> https://www.protocols.io/view/cut-amp-run-library-preparation-v3-rm7vz9errgx1/v1
---
## Running the pipeline from a personal linux:

### 👶 baby_steps.md
includes links to a brief cli introduction and how to download fastqs from Illumina NextSeq1000 runs hosted on personal basespace accounts

> users will need to have the following training, hardware, and accounts to access this step
- [ ] NextSeq1000 training with Rachal
- [ ] Library prep training with Jo
- [ ] Basespace training with Jo/Rachal
      
- [ ] Access to a personal/lab Linux
- [ ] Basespace account
      
---

### 🛠 SETUP.md
includes notes on the required software, installations steps, and nfcore set up testing
> this is specific to a personal linux, and uses Docker
> 
> Users can learn and access this and subsequent step without basespace and NextSeq1000 training

---

### 🍏 EXAMPLE_RUN.md 
includes links to all necessary documentation and all bash commands for minimal workflow
> this is configured for cell signalling cut&run assay kit #86652 using S. _cerevisiae_ for spike normalisation
---

## 🐚 shell scripts
shell scripts here were used to generate:
1. The correct PCA plots with --transpose

   Users should have deeptools installed and know to adjust paths and output names.
   > run_deeptools_pca.sh
2. Processes bigWig replicates into averaged bigWig files.
   
   Users should have downloaded the necessary .chrom.sizes file, download wiggletools, known to adjust paths and file suffixes, and establish conda env (should specify in shell script) for this script.
   > manual_replicate_averaging.sh
3. Generate matrix and plot heatmap for visualisation of genes within LADs and iLADs.

   Users should have downloaded BEDs, know to adjust paths,and # and un# the required BED files to plot other genomic features. 
   > computeMatrix_plotHeatmap_dualBED.sh

