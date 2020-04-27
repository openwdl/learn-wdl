# WDL Language Concepts

<img src="https://github.com/lynnlangit/gcp-for-bioinformatics/raw/master/images/wdl-concepts.png" width="450" align="left">

This is a short list of key WDL language concepts and keywords. To review the full WDL language specification see this [link](https://github.com/openwdl/wdl/blob/master/versions/1.0/SPEC.md). This page also includes short code snippets with examples using some WDL keyword phrases.

WDL scripts describe workflows which contain tasks.  See the diagram to the left to visualize key concepts.  This page is arranged into 4 sections:
- WDL file-level keywords
- WDL workflow keywords
- WDL task keywords
- WDL script style tips

----

**WDL File-level keywords**
- `version` - WDL Version - currently `version 1.0`
- `##` - workflow comments
- `import` - import another WDL file 
    - use external task definitions 
    - configure and call (run) those tasks in this workflow 
    - alias external file using `as`
        - i.e. `import <path\file> as myTask`
---
**Workflow-level keywords**
- `workflow` - list of variables and called tasks
    - `input` - files and/or env config values
    - `if` - check condition for task execution
        - `scatter` - parallelize a task call
            - `call` - run a task in a workflow
                - `input` - files and/or env config values for this task execution
                - example: `call myTask {input: inputFile=inputFile}`
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
        - example: `command { /bin/my_taskExec $ {inputFile}}`
        - alternate param example: `command <<< .... "~{myParam}"... >>>`
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
        - example: `parameter_meta { inputFile: "the file that myTask will use"}`

  ---  


**WDL Language Style Tips**
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
- Use Key-value input files for parameter assignments - usually `input.json`, example below:  
    `{`  
        `"WorkflowName.ParamName": "workflowParamValue",`  
        `"WorkflowName.TaskName.ParamName": "taskParamValue"`  
    `}`
- Add Comments - designated with `##` (workflow level) or `#` (task level)
