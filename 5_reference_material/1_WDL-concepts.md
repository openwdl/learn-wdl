# WDL Language Concepts

<img src="https://github.com/lynnlangit/gcp-for-bioinformatics/raw/master/images/wdl-concepts.png" width="460" align="left">  

---  


This is a short list of key WDL language concepts and keywords. To review the full WDL language specification see this [link](https://github.com/openwdl/wdl/blob/master/versions/1.0/SPEC.md). This page also includes short code snippets with examples using some WDL keyword phrases.

- WDL file-level keywords
- WDL workflow keywords
- WDL task keywords
- WDL script style tips

----

**WDL File-level keywords**
- `##` - workflow comments
- `version` - WDL Version - currently `version 1.0`
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
    - Scope Variable declarations to the Workflow, Task or Command - [link](https://support.terra.bio/hc/en-us/articles/360037485511)
    - supported primitive types include: Boolean, Int, Float, String, File - [link](https://support.terra.bio/hc/en-us/articles/360037484851)
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
- Include a WDL version number at the top of each WDL file using `version 1.0`

--- 

## WDL Style Guide

- Adopted from this Gist - https://gist.github.com/scottfrazer/aa4ab1945a6a4c331211  
- Original written by https://gist.github.com/scottfrazer
- Alternate WDL style guide - https://biowdl.github.io/styleGuidelines.html

---

## WDL Template

```
## Workflow-level comments

version 1.0

workflow WorkflowOne {
  call TaskOne
  call TaskTwo
}

# Task-level comments
task TaskOne {
  StringOne inOne
  command {
    echo '${inOne}'
  }
  output {
    String out = read_string(stdout())
  }
}

task TaskTwo {
  StringTwo inTwo
  command {
    echo '${inTwo}'
  }
  output {
    String out = read_string(stdout())
  }
  
}
```

Requires a `workflow-input.json` file as shown below:

```
{
   "WorkflowOne.TaskOne.StringOne": "my first string",
   "WorkflowOne.TaskTwo.StringTwo": "my second string"
}
```

## Code Formatting

2-spaces, braces on same line, as below  

```
task Test {
  String prefix
  command {
    ./my_script > ${prefix}.first
    python other_script.py > ${prefix}.second
  }
  output {
    File first = "${prefix}.first"
    File second = "${prefix}.second"
  }
}
```

## Write output to current working directory

Cromwell gives you a writeable directory as your `CWD` for every backend

```
task Test {
  command {
    ./do_work > do_this
    ./do_work2 > subdir/do_this
    ./do_work3 > /etc/do_not_do_this
  }
}
```

## Avoid Referencing Absolute Paths (Except when using Docker)

```
task Bad {
  File f
  command {
    java -jar /usr/lib/library.jar -Dinput=${f}
  }
}
```

Instead:

```
task Good {
  File f
  File jar
  command {
    java -jar ${jar} -Dinput=${f}
  }
}
```

If the task is only ever expected to run in the context of a Docker container, then it is okay to reference absolute paths:

```
task Okay {
  File f
  command {
    java -jar /usr/lib/library.jar -Dinput=${f}
  }
  runtime {
    docker: "broadinstitute:some-image"
  }
}
```

## Tasks can contain full scripts

If you find yourself wanting to do a small data transformation on one of the inputs, or wanting an if statement, or random number or any other piece of logic, encapsulate it in the `task's` command block:

```
task Example {
  String s
  File f
  Boolean b

  command <<<
    if [ "${b}" != 'true' ]; then
        var="first"
    else
        var="second"
    fi

    echo $var ${f} ${s}
    #java -jar picard.jar ...
  >>>

  output {
    String o = read_string(stdout())
  }
}
```

If you're more familiar with Python:

```
task Example {
  File f
  String s

  command {
    # Probably not a good idea in practice...
    pip install my_module
    
    python <<CODE
    import my_module
    
    if 'xyz' in '${s}'.split(','):
      floating_point_result = my_module.my_method('${f}')
    else:
      floating_point_result = my_module.my_method2('${f}')
    print(floating_point_result)
    CODE
  }
}
```

## Start Authoring without Docker, add Docker later

I find it easier to debug the inputs/outputs/commands of WDL file if they're not run within Docker containers.

Even if that means temporarily using absolute paths

```
task Example {
  String s
  File f
  Boolean b

  command <<<
    if [ "${b}" != 'true' ]; then
        var="first"
    else
        var="second"
    fi

    echo $var ${f} ${s}
    #java -jar picard.jar ...
  >>>

  output {
    String o = read_string(stdout())
  }
}

workflow MyWorkflow {
  call Example
}
```

Inputs (template generated with `java -jar cromwell.jar inputs example.wdl`):

```
{
  "w.example.s": "foobar",
  "w.example.f": "example.inputs",
  "w.example.b": true
}

```

![Cromwell Running](http://i.imgur.com/lQzs9W9.png)

```
if [ "true" != 'true' ]; then
    var="first"
else
    var="second"
fi
echo $var /Users/sfrazer/projects/cromwell/cromwell-executions/w/4ede86f2-52ea-4db5-a3dc-68467f264eb7/call-example/Users/sfrazer/projects/cromwell/example.inputs foobar
#java -jar picard.jar ...
```

From the output is the command you can copy/paste to run it manually:

```
"/bin/bash" "-c" "cat cromwell-executions/w/4ede86f2-52ea-4db5-a3dc-68467f264eb7/call-example/script |  /bin/bash <&0"
```

## Use WDL functions for common transformations

WDL allows compound types like `Array[String]` or `Map[String, Int]` or `Array[Array[String]]`.  There are two ways to get these data types into a form that the `command` can use:

* Serialization by concatenation (only for `Array`)
* Serialization by write-to-file

```
task Example {
  Array[String] array
  Map[String, File] map
  Array[Array[Int]] matrix
  
  command {
    echo ${sep=',' array}
    cat ${write_lines(array)}
    python script.py --map=${write_map(map)}
    python process.py ${write_tsv(matrix)}
  }
}

workflow MyWorkflow {
  call Example
}
```

```json
{
  "test.example.array": ["a", "b", "c"],
  "test.example.map": {
    "key0": "/path/to/file0",
    "key1": "/path/to/file1",
    "key2": "/path/to/file2",
  },
  "test.example.matrix": [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
}
```

Produces this command:

```
echo a,b,c
cat /tmp/array.txt
python script.py --map=/tmp/map.txt
python process.py /tmp/matrix.txt
```

`/tmp/array.txt` would contain

```
a
b
c
```

`/tmp/map.txt` would contain

```
key0  /path/to/file0
key1  /path/to/file1
key2  /path/to/file2
```

`/tmp/matrix.txt` would contain

```
0 1 2
3 4 5
6 7 8
```

use `read_*` functions go to from files output by your command into WDL values

```
task Example {
  command {
    echo 'first' > file
    echo 'second' >> file
    echo 'third' >> file
  }
  output {
    Array[String] out = read_lines("file")
  }
}
```

