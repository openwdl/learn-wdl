# Running Hello Worlds

How to run the examples
1. Setup an execution environment (can be local, cloud, etc..)
2. Select a version of hello-world
3. Follow the instructions to run each example
4. (optional) use womtool-XY.jar to validate|inputs|graph...more WDL file

---
### hello-world.wdl USES run mode
- pattern `java -jar cromwell-XY.jar run <path>/<file>.wdl`
- example `java -jar cromwell-50.jar run ./1_hello-world/1_hello-world.wdl`

### hello-world.wdl USES run mode & docker image
- pattern `java -jar cromwell-XY.jar run <path>/<file-calls-docker>.wdl`

### hello-input.wdl USES run mode & input.json (values for task or workflow)
- pattern `java -jar cromwell-XY.jar run <path>/<file>.wdl --inputs <path>/<file>.json`

### hello-world.wdl syntax validation with womtool
- pattern `java -jar womtool-XY.jar validate <path>/<file>.wdl`

### hello-inputs.wdl syntax general `inputs.json` file with womtool
- pattern `java -jar womtool-XY.jar inputs <path>/<file>.wdl`

---

### hello-server-input.wdl USES server mode 
- pattern `java -jar -server cromwell-49.jar run ./<path>/<file>.wdl --inputs ./<path>/<file>.json`

### hello-server-input.wdl USES server mode & SWAGGER UI tool
- pattern `java -jar cromwell-XY.jar server` 
- go to `localhost:8000`
- navigate to Workflows section and click "Show/Hide"
- navigate to `/workflows/{version}` which has a green "POST" on the left.
- find workflowSource file, "Choose File" and navigate to `3_hello-server_input.wdl`.
- find inputs file and navigate to `3_hello-server_input.json`.
- navigate to the bottom of this section and click "Try it out!"
- observe output from the server process.  
NOTE: can use `hello-docker.wdl` to test running docker process with cromwell server mode

### hello-world.wdl USES server mode on AWS
- set up an AWS EC2 instance will cromwell and configure the cromwell server [link](https://docs.opendata.aws/genomics-workflows/orchestration/cromwell/cromwell-examples/) 
- run this command 
    - `curl -X POST "http://localhost:8000/api/workflows/v1" \`  
    - `-H  "accept: application/json" \`
    - `-F "workflowSource=@/path/to/1_hello-world.wdl"`
