# Learn WDL

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