# Advanced WDL Pipelines

WDL Pipelines can be executed in a number of ways.  These include the following:

- LINEAR - execute tasks one after another -  ![linear](/images/linear.png)
- MULTI-OUTPUT - execute tasks using multiple outputs/inputs - ![two-output](/images/two-output.png)
- SCATTER-GATHER -  execute tasks in parallel - ![scatter](/images/scatter.png)
- TASK-ALIAS - alias a task definition using the `AS` keyword