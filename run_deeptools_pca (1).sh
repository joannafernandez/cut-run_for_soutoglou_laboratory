#!/bin/bash

# ==== User-specified path to the directory with bigWig files ====
BW_DIR="/media/bafj7/Jo3/MANUAL_LAMINB/bam/run1"

# ==== Output directory ====
OUT_DIR="$BW_DIR/deeptools_pca"
mkdir -p "$OUT_DIR"

# ==== Find all .bigWig files and sort them ====
BIGWIG_FILES=($(ls "$BW_DIR"/*.bw | sort))

# ==== Generate labels based on filenames (basename without .bigWig) ====
LABELS=()
for bw in "${BIGWIG_FILES[@]}"; do
  base=$(basename "$bw" .bw)
  LABELS+=("$base")
done

# ==== Convert arrays to space-separated strings ====
BW_FILES_STR="${BIGWIG_FILES[*]}"
LABELS_STR="${LABELS[*]}"

# ==== File names for outputs ====
MATRIX_OUT="$OUT_DIR/bigwig_matrix.npz"
RAWCOUNTS_OUT="$OUT_DIR/bigwig_counts.tab"
PCA_OUT="$OUT_DIR/pca_plot.pdf"

# ==== Run multiBigwigSummary ====
multiBigwigSummary bins \
  --bwfiles $BW_FILES_STR \
  --labels $LABELS_STR \
  --binSize 1000 \
  --outFileName "$MATRIX_OUT" \
  --outRawCounts "$RAWCOUNTS_OUT" \
  -p 26

# ==== Run plotPCA ====
plotPCA \
  -in "$MATRIX_OUT" \
  -o "$PCA_OUT" \
  --plotTitle "PCA of CUT&Tag bigWigs" \
  --transpose
