# WDL Execution Environment Setups

Here is a list of execution environments for WDL scripts running on cromwell plus some compute environment (i.e. local, cloud, HPC...).  

### Local
- **laptop**
  - cromwell execution --or--
    - `cromwell-XY.jar` to run WDL scripts
    - jdk - Java is required
    - docker tools (if using docker container images)
    - `example.wdl` (can use `params.wdl.json`)
    - cromwell has two possible execution modes 
      - 'run' for running single WDL workflows --or-- 
      - 'server' for scaling multiple WDL workflows - for more see this [link](https://cromwell.readthedocs.io/en/stable/Modes/)
    - `womtool-XY.jar` to validate | (generate) inputs (file)| graph....more for WDL files
  - cromshell execution --or--
    - designed for local testing - [link](https://github.com/broadinstitute/cromshell)
    - a script for submitting workflows to a cromwell server and monitoring / querying their results
  - miniWDL execution --or--
    - get miniWDL tool
    - article about miniWDL - [link](https://medium.com/czi-technology/miniwdl-17ecdaf40944)
  - dockstore execution --or--
    - you can test locally with Dockstore - [link](https://docs.dockstore.org/en/develop/getting-started/)getting-started-with-wdl.html
  - oliver execution --or--
    - "An opinionated Cromwell orchestration manager." - [link](https://stjudecloud.github.io/oliver/)
    - Workflow Orchestration. Easily submit, inspect, kill, and retry workflows in a Cromwell environment.
    - Better Job Tracking. Jobs can be associated with names and job groups to enable better status reporting.
    - Dynamic Argument Parsing. Specify inputs and options on the command line rather than editing JSON files.
    - Third-party Cloud Integrations. Use the aws and azure subcommands to explore cloud-specific functionality.

- **HPC**
    - Link to using cromwell on SLURM - https://cromwell.readthedocs.io/en/stable/backends/SLURM/
---

### Public Cloud

- **GCP**
  - This [tutorial](https://wdl-runner.readthedocs.io/en/latest/GettingStarted/TutorialOverview/#tutorial-scenario) shows running a multi-stage workflow on GCP
      - The workflow is launched with Google Life Sciences API
      - The workflow is defined using WDL
      - The workflow stages are orchestrated by cromwell
      - The workflow runs on multiple Google Compute Engine VMs
      - a master node is created for cromwell
      - cromwell submits each workflow stage as one or more separate pipelines
  - The `wdl_runner` tool spins up a Cromwell server on a GCP VM & launches a WDL workflow by submitting it to the newly created Cromwell server. - [link](https://github.com/broadinstitute/wdl-runner)
- **AWS** - this [link](https://docs.opendata.aws/genomics-workflows/quick-start/) to AWS Cloud Formation template to set up AWS EC2 cromwell instance
  - requires AWS EC2 key pair
  - requires AWS S3 bucket
  - Alternatively - `miniwdl-cloud` targets FSx Lustre, uses Terraform and is intitally designed to run on AWS - [link](https://github.com/mlin/miniwdl-cloud). See also `miniwdl' at [link](https://github.com/chanzuckerberg/miniwdl)
- **Azure** - this [link](https://github.com/microsoft/CromwellOnAzure) to example code in GitHub
  - uses cromwell TES backend w/CosmosDB
  - uses Azure Batch
  - uses Azure Block Blob Storage
      
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
