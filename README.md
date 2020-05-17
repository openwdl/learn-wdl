# learn-wdl
![WDL icon](/images/wdl-icon.png)  


- The Workflow Description Language (WDL) is a way to specify data processing workflows with a human-readable and -writeable syntax. It was originally developed for genomics, but can be extended to other domain. About the open WDL language - [link](https://openwdl.org/)
- This Repo contains educational materials for learning WDL (Workflow Description Language)
- **IMPORTANT** This Repo uses `cromwell-50.jar` for testing all WDL example scripts

# Language
- reuse, reconfigure or write WDL script
- examples, lessons (and sample data) in this Repo
- WDL keyword summary in this Repo

# Verification & Visualization
- use tools to verify WDL syntax, tools include `womtool` and others
- womtool syntax - `java -jar womtool-XY.jar <action> ./path/file.wdl` 
    - actions include the following:
        - `validate` (WDL syntax & semantics)
        - `inputs` (create JSON input file)
        - `highlight` (reformat/color WDL)
        - `parse` (WDL syntax only)
        - `graph` (outputs a .dot of WDL DAG)
        - `womgraph` (print a graph)

# Execution
- setup WDL runtime environment for testing (dev) and production
- you can run WDL scripts on your laptop, local HPC cluster or public cloud

# Execution Syntax Examples
- if running WDL script with **Cromwell**
    - select `run` (single workflow) or `sever` (multiples) mode
    - run mode  `java -jar cromwell-XY.jar run ./path/file.wdl` 
    - run mode using specified input file  `java -jar cromwell-XY.jar run ./path/file.wdl --inputs ./path/input.json`
    - server mode  `java -jar -server cromwell-XY.jar run ./path/server.wdl`
- if running WDL script with **womtool**
    - example  `java -jar womtool-XY.jar <action> ./path/file.wdl` 
    - actions include the following:
        - `validate` (WDL syntax & semantics)
        - `inputs` (create JSON input file)
        - `highlight` (reformat/color WDL)
        - `parse` (WDL syntax only)
        - `graph` (outputs a .dot of WDL DAG)
        - `womgraph` (print a graph <.dot> file)

- if running on public cloud, can use `wdl_runner` - [link](https://wdl-runner.readthedocs.io/en/latest/GettingStarted/TutorialSteps/)  this uses cromwell and also GCP Life Sciences (or Pipelines) API to allocate resources (VMs) on GCP  
    - example: 
        `gcloud alpha genomics pipelines run --pipeline-file wdl_pipeline.yaml `
                `--regions us-central1 --inputs-from-file WDL=test-wdl/ga4ghMd5.wdl,`
                `WORKFLOW_INPUTS=test-wdl/ga4ghMd5.inputs.json,`
                `WORKFLOW_OPTIONS=test-wdl/basic.papi.us.options.json `
                `--env-vars WORKSPACE=gs://YOUR-BUCKET/wdl_runner/work,`
                `OUTPUTS=gs://YOUR-BUCKET/wdl_runner/output `
                `--logging gs://YOUR-BUCKET/wdl_runner/logging`
    - When submitted using the Pipelines API, the workflow runs on multiple Google Compute Engine virtual machines. 
    
    - First a master node is created for Cromwell, and then Cromwell submits each stage of the workflow as one or more separate pipelines. 
    
    - Execution of a running Pipeline proceeds as:

        - Create Compute Engine virtual machine
        - On the VM, in a Docker container, execute wdl_runner.py
        - Run Cromwell (server)
        - Submit workflow, inputs, and options to Cromwell server
        - Poll for completion as Cromwell executes:
        - Call `pipelines.run()` to execute call 1
        - Poll for completion of call 1
        - Call `pipelines.run()` to execute the next call
        - Poll for completion of the next call
        - Repeat steps 3-4 until all WDL "calls" complete>
        - Copy workflow metadata to output path
        - Copy workflow outputs to output path
        - Destroy Compute Engine Virtual machine

- if testing, can use `miniwdl` - [link](https://github.com/chanzuckerberg/miniwdl) - requires Docker
    - `pip install miniwdl` --or-- `conda install miniwdl`
    - miniwdl check `miniwdl run_self_test` - verifies miniwdl is working
    - miniwdl check `miniwdl check --path path/myWdl.wdl` - lints WDL
    - miniwdl input checker `miniwdl run hello.wdl` shows missing inputs
    - miniwdl param test run `miniwdl run hello.wdl who=Lynn "who=SoCalDevGal" x=42` runs with test inputs

- if testing submitting one or more workflows to a cromwell server, can use `cromshell` - [link](https://github.com/broadinstitute/cromshell) - requires Docker
    - `brew install broadinstitute/dsp/cromshell` --or-- `conda install cromshell`
    - also requires `column`, `curl`, `mail` and `jq`
    - cromshell run `cromshell submit workflow.wdl inputs.json` - can set timeout values, can start/stop/abort workflows
        - can get status, metadata, execution-status-count, timing (timing diagram in a browser), logs, fetch-logs...more



