# Learn WDL Course Outline

![learn-wdl-tasks](https://github.com/openwdl/learn-wdl/blob/master/images/learn-wdl-tasks.png)

## Learn Key WDL Concepts
- Via example WDL scripts
    - Write, test and run
    - Understanding errors, using womtool (linter)
    - Working with parameters and data
        - input.json file
        - using GCP file buckets
    - Working with Docker images
- Via example WDL screencasts
    - cromwell/womtool
        - Setup WDL Dev env - local
        - Setup WDL Dev env - cloud (GCP)
    - other dev (run) environments
        - AWS / AWS Batch
        - DNANexus
## Configure and run example WDL Workflows
- Via Terra.bio
    - Workflows playground
        - Run sam-to-bam WDL Workflow
        - Configure and run sam-to-bam WDL workflow
        - Run haplotype caller WDL Workflow w/GCP file (bucket) paths
        - Run haplotype caller WDL Workflow w/Terra data model
- Via other tools / locations
## Write your own WDL Tasks / Workflows
- Write and test WDL Workflows
    - One task workflow (linear)
    - Two task workflow (linear)
    - Two task workflow (two-output)
    - Two task workflow (scatter-gather)
    - Main workflow w/two task sub-workflow (aliases tasks)
## Optimize / Scale WDL Pipelines 
- Guidance for documentation/readability
    - Versioning, comments, aliasing/subworkflows
- Guidance for Docker images / bioinformatics tools
- Guidance for GCP
    - pre-emptible GCE instances
- Guidance for Terra
    - Group small tasks together for best performance using GCP Life Sciences API

----
# WDL Cookbook

Goal: Leveled-approach to learning WDL script features for scalable genomic pipelines.
---
* Method: Series of one-two feature recipes, using scripts or genomic tools (GATK)
* Implementation: 
  - Local (laptop or HPC) or 
  - Cloud (GCP or AWS) or 
  - SaaS genomics tool (Terra.bio, DNANexus...)
---
## Outline

- Hello World - many ways - simple, params, multi-threaded
- Sam-to-Bam - many ways - as above
- 2 part pipeline
- Simplest possible real world task (3 to 5 part pipeline)
- Subsampled jobs - should run in 5 minutes, job flow can be moderately complex
- Common real world jobs (still subsampled) - max run time 15 min on cloud, should be free (within free tier)
- Scaled-up real-world jobs - could take 60 min or longer and cost ~ $5 (is this possible?)
- Finding reference WDL pipelines for various execution environments (HPC, GCP, AWS, Terra.bio...)
  - Open source collection of WDL tool scripts for bioinformatics at `biowdl` - [link](https://github.com/biowdl/tasks)
  - Using IMPORTS statements in WDL scripts - https://cromwell.readthedocs.io/en/stable/Imports/

## Best Practices for WDL

- known patterns for general WDL
- known patterns for WDL locally / HPC (Slurm)
- known patterns for WDL on GCP (includes on Google Life Sciences API)
- known patterns for WDL on AWS
- general anti-patterns for WDL

## Other important areas

- Understanding cromwell (implementation modes) and WDL
- Finding and using well-crafted Docker container mages which include common bioninformatics tools (for use in WDL pipelines)
- Creating your own Docker containers for bioinformatics scripts or tools - best practices
  - for example, do NOT include sample data in container definition, refer to a public cloud bucket location or mount an external volume
- Future of WDL, contributing to OpenWDL
- Finding and using appropriately-sized sample datasets for learning

