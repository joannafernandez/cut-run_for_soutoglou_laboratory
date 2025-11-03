#!/bin/bash

# Number of cores to use
cores=25

# Define the project path
#projPath=/media/bafj7/ExtremeSSD/Cutandtag/Crick-Sussex/NP_data/Rawdata/fastq/nemo/lab/boultons/data/STPs/babs/inputs/nishita.parnandi/asf/PM22043/240619_A01366_0551_BHHVV5DSXC/fastq"
projPath='/media/bafj7/Jo3/MANUAL_LAMINB/bam/run2'  

  
# Create the plots directory if it doesn't exist
mkdir -p "${projPath}/plots"

# Check if input files exist
#bw1="${projPath}/LaminB1_YDpn1_N4OHT_averaged_signal.bigWig"
#bw2="${projPath}/LaminB1_YDpn1_Y4OHT_averaged_signal.bigWig"
bw1="${projPath}/LaminB1_minusS_averaged_signal.bigWig"
bw2="${projPath}/LaminB1_S_OHT_averaged_signal.bigWig"

bedFile='/media/bafj7/Jo3/LADs_HT1080.bed' 
#bedFile=/home/bafj7/Desktop/hg38_transcripts_TSS_TES.bed'
#bedFile=/media/bafj7/ExtremeSSD/Cutandtag/Crick-Sussex/NP_data/Published data/normsortbed.bed'  
#bedFile=/media/bafj7/Jo3/output_run2_SonOHT/00_genome/annotation/genes.bed.sorted.bed'  
#bedfile_in=/media/bafj7/Jo3/tryingtosplit/LAD.bed' 
#bedfile_out=/media/bafj7/Jo3/tryingtosplit/iLAD.bed' 

if [[ ! -f "$bw1" || ! -f "$bw2" ]]; then
  echo "One or more bigWig files are missing."
  exit 1
fi

if [[ ! -f "$bedFile" ]]; then
  echo "BED file is missing."
  exit 1
fi

#if [[ ! -f $bedfile_in || ! -f $bedfile_out" ]]; then
#  echo One or more BED files are missing."
#  exit 1
#fi

# Run computeMatrix
computeMatrix scale-regions  \
  -S "$bw1" \
     "$bw2" \
  -R "$bedFile" \
  --beforeRegionStartLength 0 \
  --regionBodyLength 5000 \
  --afterRegionStartLength 0 \
  --binSize 50 \
  --skipZeros \
  --missingDataAsZero \
  -o "${projPath}/plots/matrix_gene.mat.gz" \
  -p $cores


# Check if computeMatrix succeeded
if [[ $? -ne 0 ]]; then
  echo "computeMatrix failed."
  exit 1
fi

# Run plotHeatmap
plotHeatmap \
  -m "${projPath}/plots/matrix_gene.mat.gz" \
  -out "${projPath}/plots/LAD_nodpn1_lb1_16625.png" \
  --sortUsing mean \
  --colorMap viridis

# Check if plotHeatmap succeeded
if [[ $? -ne 0 ]]; then
  echo "plotHeatmap failed."
  exit 1 
fi

echo "✅ Heatmap generation completed successfully."

