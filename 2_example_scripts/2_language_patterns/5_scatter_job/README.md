# Run TimingWorkflow

Submit to cromwell:
- If it's not running already, start the cromwell server:
- `java -jar cromwell-xy.jar server`

Submit the workflow:  
 - `curl -X POST --header "Accept: application/json"\`
 -	`-v "localhost:8000/api/workflows/v1" \`
 -	`-F workflowSource=@TimingWorkflow.wdl`
  
View the curl output to get the workflow ID  
 - `[...] Workflow 8d18b845-7143-4f35-9543-1977383b7d2f submitted.`

Enter the following address into your web browser to see the timing diagram for your workflow.   
You'll need to swap out my workflow ID for the one that you received   
 - `http://localhost:8000/api/workflows/v1/8d18b845-7143-4f35-9543-1977383b7d2f/timing`  

After your tasks complete you should see a visual output of the task execution timings for your workflow.

If running on Terra.bio - use `scatter-docker.wdl`, as docker attribute is required for WDL on Terra.