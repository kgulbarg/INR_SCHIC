# INR Latent Embeddings for scHi-C (Nagano) → Vanilla Classifier

This repo learns one latent vector `cell_name_latent.npy` per cell using a shared conditional INR (Implicit Neural Representation).
We train the INR to regress `log1p(count)` from 2D bin coordinates. The per-cell latent vectors become the features for a simple downstream classifier to predict cell cycle stage.

## Inputs
- `Nagano_Data/<label>/<cell_id>/chr*.txt` files with columns: `bin1 bin2 count` (The folder "Nagano_Data" contains the raw single-cell Hi-C data from 1171 cells of four types, namely G1 (280), early-S (303), mid-S (262), and late-S/G2 (326).)
- `mm10.main.nochrM.chrom.sizes` (mm10 chromosome sizes; `chrM` excluded. Has lengths of each of the 20 chromosomes in a mouse cell, with the unit of measurement being the number of base pairs contained in the chromosome.)

## Steps
1. `latents_pipeline.ipynb` parses contacts and optimizes a shared INR + per-cell embeddings.
2. `classifier_pipeline.ipynb` fits a vanilla classifier on latent vectors.

DISCLAIMER:
Dataset has been taken from https://github.com/HaoWuLab-Bioinformatics/scHiClassifier/tree/master/Nagano/Nagano_Data.