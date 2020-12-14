# WDL Dev Env

There are a number of choices for WDL script execution.  In this course, we used the setup listed immediately below (GCP + cromwell).  Detailed steps to replicate our setup our included.  Below this setup is a list of other possible WDL environment setups.  

### THIS COURSE: Public Cloud - Using GCP (GCE VM) & cromwell

To set up the image
- Create a GCE instance from a base Ubuntu image w/100 GB of storage
- SSH into your instance
- Get JDK 
    - `sudo apt install openjre-8-headless`
- Install Docker 
    - using `curl -sS https://get.docker.com/ | sh`
- Start Docker 
    - using `sudo usermod -aG docker $USER`
- Make a directory for cromwell 
    - using `mkdir cromwell`, cd to that directory
- Get cromwell 
    - using `curl -L -o cromwell-50.jar https://github.com/broadinstutite/cromwell/releases/download/50/cromwell-50.jar`
- Get womtool 
    - using `curl -L -o womtool-50.jar https://github.com/broadinstutite/cromwell/releases/download/50/womtool-50.jar`
- Verify cromwell 
    - using `sudo java -jar cromwell-50.jar --help`
- Create a WDL file 
    - using `touch hello.wdl` to create file
- Populate the WDL file 
    - using `nano hello.wdl` copy the WDL script from [link](https://github.com/openwdl/learn-wdl/blob/master/1_script_examples/1_hello_worlds/1_hello/hello.wdl)
- Run the WDL file (cromwell `run` mode)
    - using `sudo java -jar cromwell-50.jar run hello.wdl`

IMPORTANT: `STOP` the instance when you are not using it to save money.

Diagram of cromwell for WDL on GCP setup shown below

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/cromwell-on-gcp.png" width=600>

**ALTERNATE:** You can use the miniwdl library to run WDL scripts(see links below). Miniwdl requires Python and Docker Swarm (rather than Java and cromwell).  Diagram of miniwdl for WDL on GCP setup shown below.

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/miniwdl-on-gcp.png" width=600>

---

## OTHER CHOICES: WDL Execution Environment Setups

Here is a list of possible execution environments for WDL scripts.  EACH of the environments listed below can be run on your choice of compute environment (i.e. local, cloud, HPC...).  

### Local WDL Execution Environment options (laptop or HPC)

- **1. cromwell** execution --or--
    - `cromwell-XY.jar` to run WDL scripts
        - jdk - Java is required
        - docker tools (if using docker container images)
        - `example.wdl` (can use `params.wdl.json`)
    - cromwell has two possible execution modes 
      - `run` for running single WDL workflows --or-- 
      - `server` for scaling multiple WDL workflows - for more see this [link](https://cromwell.readthedocs.io/en/stable/Modes/)
      - `validate | (generate) inputs` (file)| graph....more for WDL files use `womtool-XY.jar` 
- **2. cromshell** execution --or--
    - designed for local testing - [link](https://github.com/broadinstitute/cromshell)
    - a script for submitting workflows to a cromwell server and monitoring / querying their results
- **3. miniWDL** execution --or--
    - requres Python 3.6+, pip | conda to install miniwdl, optionaly graphviz (for DAG visualizations)
    - get miniWDL tool - [link](https://github.com/chanzuckerberg/miniwdl)
    - article about miniWDL - [link](https://medium.com/czi-technology/miniwdl-17ecdaf40944)
    - miniWDL best practices - [link](https://miniwdl.readthedocs.io/en/latest/runner_advanced.html)
    - get miniWDL plug ins - [link](https://github.com/chanzuckerberg/miniwdl-plugins) for AWS Fargate and AWS S3
- **4. dockstore** execution --or--
    - you can test locally with Dockstore - [link](https://docs.dockstore.org/en/develop/getting-started/getting-started-with-wdl.html)
- **5. oliver** execution --or--
    - "An opinionated Cromwell orchestration manager." - [link](https://stjudecloud.github.io/oliver/)
    - Workflow Orchestration. Easily submit, inspect, kill, and retry workflows in a Cromwell environment.
    - Better Job Tracking. Jobs can be associated with names and job groups to enable better status reporting.
    - Dynamic Argument Parsing. Specify inputs and options on the command line rather than editing JSON files.
    - Third-party Cloud Integrations. Use the aws and azure subcommands to explore cloud-specific functionality.
- **6. hpc**
    - Link to using cromwell on SLURM - https://cromwell.readthedocs.io/en/stable/backends/SLURM/
---

### Public Cloud

- **1. GCP**
  - This [tutorial](https://wdl-runner.readthedocs.io/en/latest/GettingStarted/TutorialOverview/#tutorial-scenario) shows running a multi-stage workflow on GCP
      - The workflow is launched with Google Life Sciences API
      - The workflow is defined using WDL
      - The workflow stages are orchestrated by cromwell
      - The workflow runs on multiple Google Compute Engine VMs
      - a master node is created for cromwell
      - cromwell submits each workflow stage as one or more separate pipelines
  - The `wdl_runner` tool spins up a Cromwell server on a GCP VM & launches a WDL workflow by submitting it to the newly created Cromwell server. - [link](https://github.com/broadinstitute/wdl-runner)
- **2. AWS** - this [link](https://docs.opendata.aws/genomics-workflows/quick-start/) to AWS Cloud Formation template to set up AWS EC2 cromwell instance
  - requires AWS EC2 key pair
  - requires AWS S3 bucket
  - Alternatively - `miniwdl-cloud` targets FSx Lustre, uses Terraform and is intitally designed to run on AWS - [link](https://github.com/mlin/miniwdl-cloud). See also `miniwdl' at [link](https://github.com/chanzuckerberg/miniwdl)
- **3. Azure** - this [link](https://github.com/microsoft/CromwellOnAzure) to example code in GitHub
  - uses cromwell TES backend w/CosmosDB
  - uses Azure Batch
  - uses Azure Block Blob Storage
- **4. Github Codespaces** - this [link](https://github.com/features/codespaces) to request access to Github Codespaces.
  - use the repo branch named codespaces
  - uses `broadinstitute/cromwell` docker image
  - Codespaces starts an Azure VM when you create/start the custom Codespace
---      

### Bioinformatics Platforms that use WDL scripts
- **1. Terra.bio** - runs on GCP
  - Here is a [link](https://app.terra.bio/#workspaces/fc-product-demo/Terra-Workflows-Quickstart) to a Terra.bio workspace which includes 3 versions of a WDL workflow
  - Requires an account on Terra.bio (can use free $ 300 in GCP credits to try this out)
- **2. IDseq**
   - Requires an account on `IDseq.net` platform (can try for free after approval) - [link](https://www.discoveridseq.com/)
- **3. DNANexus**
   - Requires an account on `https://www.dnanexus.com/`
    
---

 ### Open Source Libraries that run with WDL + cromwell
  - **Apache Spark** - link to example - https://cromwell.readthedocs.io/en/stable/backends/Spark/
