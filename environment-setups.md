# WDL Execution Environment Setups

Here is a list of execution environments for WDL scripts.  

### Local
- **laptop**
  - cromwell execution --or--
    - `cromwell-XY.jar`
    - jdk
    - docker tools (if using docker container images)
    - `example.wdl` (can use `params.wdl.json`)
    - cromwell has two modes - 'run' for single workflows --or-- 'server' for scaling multiple workflows
  - miniWDL execution
    - get miniWDL tool
    - IMPORTANT: this section is in progress
- **HPC**
    - Link to using cromwell on SLURM - https://cromwell.readthedocs.io/en/stable/backends/SLURM/
---

### Public Cloud
- **AWS** - this [link](https://docs.opendata.aws/genomics-workflows/quick-start/) to AWS Cloud Formation template to set up AWS EC2 cromwell instance
  - requires AWS EC2 key pair
  - requires AWS S3 bucket
  - Alternatively - `miniwdl-cloud` targets FSx Lustre, uses Terraform and is intitally designed to run on AWS - [link](https://github.com/mlin/miniwdl-cloud). See also `miniwdl' at [link](https://github.com/chanzuckerberg/miniwdl)
- **GCP**
  - This [tutorial](https://wdl-runner.readthedocs.io/en/latest/GettingStarted/TutorialOverview/#tutorial-scenario) shows running a multi-stage workflow on GCP
      - The workflow is launched with Google Life Sciences API
      - The workflow is defined using WDL
      - The workflow stages are orchestrated by cromwell
      - The workflow runs on multiple Google Compute Engine VMs
      - a master node is created for cromwell
      - cromwell submits each workflow stage as one or more separate pipelines
      
---      

### Bioinformatics Platforms 
- **Terra.bio** - runs on GCP
  - Here is a [link](https://app.terra.bio/#workspaces/fc-product-demo/Terra-Workflows-Quickstart) to a Terra.bio workspace which includes 3 versions of a WDL workflow
  - Requires an account on Terra.bio (can use free $ 300 in GCP credits to try this out)
 - **DNANexus**
    - IMPORTANT: this section is in progress
    
---

 ### Libraries
  - **Apache Spark** - link to example - https://cromwell.readthedocs.io/en/stable/backends/Spark/
