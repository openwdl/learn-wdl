# Run the HaplotypeCaller Example on AWS

This takes 60-90 minutes to run. Use the command below.    
Requires correct configuration of cromwell server for your AWS EC2 instances.

`$ curl -X POST "http://localhost:8000/api/workflows/v1" \`  
  `-H  "accept: application/json" \`  
  `-F "workflowSource=@HaplotypeCaller.aws.wdl" \`  
  `-F "workflowInputs=@HaplotypeCaller.aws.json"`
  
 ## Viz of Workflow
 
 <img src="https://github.com/openwdl/learn-wdl/blob/master/3_genomic_tool_pipelines/3_haplotype_caller_GATK/wdl-haplotype.png" width=800>
