# Cloud Specs for Consensus-genome.wdl

## Tested on GCP or AWS

- GCP Notebook (VM) instance or AWS Sagemaker Notebook (VM) instance
  - Notebook VMs include Python3, pip3 and Docker
  - GCP GCE Notebook instance type `n1-standard-16` costs ~ $ .50/hr
  - AWS Notebook instance type `ml.m5.4xlarge` costs ~ $ 1.00/hr
  - 16 CPUs, 60 GM RAM, 100 GB boot disk, 250 GB data disk
- Test run info
  - ~ 4 min to run `update-run.wdl` from consensus-genome director of this Repo - https://github.com/chanzuckerberg/idseq-workflows
  - ~ 1 min to run same file with miniwdl call and download caches enabled
  - uncached each test ~ 5 GB of storage (use `df -h` to check disk space used on running VMs)
  - using sample input files from this Repo - https://github.com/chanzuckerberg/idseq-workflows/tree/main/tests/consensus-genome
    - `sample_sars_cov-2_paired_r1.fasta.qz` (4.8 MB)
    - `sample_sars_cov-2_paired_r2.fasta.qz` (4.8 MB)
  - using sample input parameters defined below  `local_test.yml` and from this Repo - https://github.com/chanzuckerberg/idseq-workflows/tree/main/tests/consensus-genome

      ````
      ref_fasta: "s3://idseq-public-references/consensus-genome/MN908947.3.fa"
      ref_host: "s3://idseq-public-references/consensus-genome/human_chr1.fa"
      kraken2_db_tar_gz: "s3://idseq-public-references/consensus-genome/kraken_coronavirus_db_only.tar.gz"
      primer_bed: "s3://idseq-public-references/consensus-genome/artic_v3_primers.bed"
      ercc_fasta: "s3://idseq-public-references/consensus-genome/ercc_sequences.fasta"
      ````

## Version Information

- miniwdl v0.11.0
- GCP OS Linux Debian 10 --or-- - AWS Linux
- Python 3.7
- pip3
- Docker 19.03.14
- Docker container image `idseq-consensus-genome:latest` - built image size is 1.8 GB
