# WDL Language Concepts

This is a list of WDL language concepts (keywords)  

**WDL File-level keywords**
- `version` - WDL Version - currently `version 1.0`
- `##` - workflow comments
- `import` - import another WDL file & alias with `as`
---
**Workflow-level keywords**
- `workflow` - list of variables and called tasks
    - `input` - files and/or env config values
    - `if` - check condition for task execution
        - `scatter` - parallelize a task call
            - `call` - run a task in a workflow
                - `input` - files and/or env config values for this task execution
                - `batch_size` - set batch size (for scattered task executions)
    - parameters - in the form of `${param_name}`
    - variables - strongly typed
    - `meta` - metadata for WDL workflow
        - `author`- author name
        - `email` - author email
        - `description` - description of workflow
        - `version` - version of workflow
        - `last_modified` - date
        - `last_revised_by` - name
---
**Task-level keywords**

- `task` - action, includes...
    - `#` - task or command-level comments
    - `input` - files and/or env config values
    - `command` - runs a script
        - alternate param syntax...
            - `command <<< .... "~{myParam}"... >>>`
    - `output` - produces a result (usually a file)
    - `runtime` - execution environment 
        - `docker` - path to docker image (in public registry or on local disk)
        - `memory` - allocated memory for runtime
        - `cpu` - number of cpus allocated for runtime
        - `disks` - type/size of disks
        - `preemptible` - for GCP - use preemptible VMs
        - `continueOnReturnCode` - usually [0.1]
    - `meta` - metadata for WDL task
        - `author`- author name
        - `email` - author email
        - `description` - description of task
        - `version` - version of workflow
        - `last_modified` - date
        - `last_revised_by` - name
    - variables - strongly typed (c-language features below)
    - parameters - in the form of `${param_name}`
        - `param_meta` - at task level, additional information about task-level parameters

  ---  


**WDL Language Style Information**
- Use 1 WORKFLOW per WDL file
- Use 0...n TASKS per workflow / WDL file 
- Shorten long WDL files using `imports` statement
    - enables references to task(s) descriptions in referenced WDL files - examples [link](https://cromwell.readthedocs.io/en/stable/Imports/)
    - enables references to sub workflows in referenced WDL files - examples [link](https://cromwell.readthedocs.io/en/stable/SubWorkflows/)
- List the Workflow and task calls BEFORE the task descriptions in each WDL file
- Use strong typing when defining Variables
    - Scope Variable declarations to the Workflow, Task or Command
    - supported primitive types include: Boolean, Int, Float, String, File
    - other supported types include: Array, Map (for key-value pairs), Object
    - supported type prefix options include: 
        - “?” for a variable that can be optional
        - “+” for Arrays that the array must have at least one entry
- Assign Parameters at scope (workflow, task, command)
- Use Key-value input files for parameter assignments - usually `input.json`
    - `{"WorkflowName.ParamName": "workflowParamValue",`
    - `"WorkflowName.TaskName.ParamName": "taskParamValue",}`
- Add Comments - designated with `##` (workflow) or `#` (task)
