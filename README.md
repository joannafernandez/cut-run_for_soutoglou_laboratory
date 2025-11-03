# ✂️🏃‍♂️ Cut&RUN Analysis Pipeline — Soutoglou Laboratory 
Using nf-core cutandrun v 3.2.2 🧬🍏 
https://github.com/nf-core/cutandrun
> The nf-core framework for community-curated bioinformatics pipelines.
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
> Nat Biotechnol. 2020 Feb 13. doi: 10.1038/s41587-020-0439-x.
---

## 🛠 SETUP.md
includes notes on the required software, installations steps, and nfcore set up testing
> this is specific to a personal linux, and uses Docker

---

## 🍏 EXAMPLE_RUN.md 
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
   > manual_replicate_averaging
3. Generate matrix and plot heatmap for visualisation of genes within LADs and iLADs.

   Users should have downloaded BEDs, know to adjust paths,and # and un# the required BED files to plot other genomic features. 
   > computeMatrix_plotHeatmap_dualBED.sh

