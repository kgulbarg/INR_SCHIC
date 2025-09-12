#!/bin/bash
#SBATCH --job-name=latent_pipeline
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=04:00:00
#SBATCH --output=nb-%j.out

set -euo pipefail
cd "$SLURM_SUBMIT_DIR"

mkdir -p outputs
python -m papermill latents_pipeline.ipynb outputs/latents_pipeline_run.ipynb \
  -k schicenv --cwd . --log-output --progress-bar
