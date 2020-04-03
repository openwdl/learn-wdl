# Running Hello Worlds

How to run the examples
1. Setup an execution environment (can be local, cloud, etc..)
2. Select a version of hello-world
3. Follow the insructions to run the example

---
### hello-world.wdl USES run mode
- run `java -jar cromwell-XY.jar run hello-world.wdl`

### hello-input.wdl USES run mode
- run `java -jar cromwell-XY.jar run hello-world.wdl --inputs hello-input.json`

### hello-server-inputs.wdl USES server mode
- run `java -jar cromwell-[version].jar server` 
- go to `localhost:8000`
- navigate to Workflows section and click "Show/Hide"
- navigate to `/workflows/{version}` which has a green "POST" on the left.
- find workflowSource file, "Choose File" and navigate to `hello-server-inputs.wdl`.
- find inputs file and navigate to `hello-server_inputs.json`.
- navigate to the bottom of this section and click "Try it out!"
- observe output from the server process.

### hello-aws-server.wdl USES server mode on AWS
- set up an AWS EC2 instance will cromwell and configure the cromwell server [link](https://docs.opendata.aws/genomics-workflows/orchestration/cromwell/cromwell-examples/) 
- run this command 
    - `curl -X POST "http://localhost:8000/api/workflows/v1" \`  
    - `-H  "accept: application/json" \`
    - `-F "workflowSource=@/path/to/hello-aws-server.wdl"`
