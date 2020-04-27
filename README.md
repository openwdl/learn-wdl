# learn-wdl
Educational materials for learning WDL

# Language
- reuse, reconfigure or write WDL script
- examples (and sample data) in this Repo
- WDL keyword summary in this Repo

# Verification & Visualization
- use tools to verify WDL syntax, tools include `womtool` and others
- womtool syntax - `java -jar womtool-XY.jar <action> ./path/file.wdl` 
    - actions include validate (WDL syntax & semantics), inputs (create JSON input file), highlight (reformat/color WDL), parse (WDL syntax only), graph (outputs a .dot of WDL DAG), womgraph (print a graph)

# Execution
- setup WDL runtime environment for testing (dev) and production
- you can run WDL scripts on your laptop, local HPC cluster or public cloud

# Execution Syntax Examples
- if running WDL script with **Cromwell**
    - select `run` (single workflow) or `sever` (multiples) mode
    - run mode  `java -jar cromwell-XY.jar run ./path/file.wdl` 
    - run mode using specified input file  `java -jar cromwell-XY.jar run ./path/file.wdl --inputs ./path/input.json`
    - server mode  `java -jar -server cromwell-49.jar run ./path/server.wdl`

- if running on public cloud, can use wdl_runner - [link](https://wdl-runner.readthedocs.io/en/latest/GettingStarted/TutorialSteps/)  
    example: `gcloud alpha genomics pipelines run --pipeline-file wdl_pipeline.yaml `
                `--regions us-central1 --inputs-from-file WDL=test-wdl/ga4ghMd5.wdl,`
                `WORKFLOW_INPUTS=test-wdl/ga4ghMd5.inputs.json,`
                `WORKFLOW_OPTIONS=test-wdl/basic.papi.us.options.json `
                `--env-vars WORKSPACE=gs://YOUR-BUCKET/wdl_runner/work,`
                `OUTPUTS=gs://YOUR-BUCKET/wdl_runner/output `
                `--logging gs://YOUR-BUCKET/wdl_runner/logging`

if testing, can use `miniwdl` - [link](https://github.com/chanzuckerberg/miniwdl) - requires Docker
    - `pip install miniwdl` --or-- `conda install miniwdl`
    - miniwdl check `miniwdl run_self_test` - verifies miniwdl is working
    - miniwdl check `miniwdl check --path path/myWdl.wdl` - lints WDL
    - miniwdl input checker `miniwdl run hello.wdl` shows missing inputs
    - miniwdl param test run `miniwdl run hello.wdl who=Lynn "who=SoCalDevGal" x=42` runs with test inputs

