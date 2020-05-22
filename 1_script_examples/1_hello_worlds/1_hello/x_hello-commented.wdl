## Use double '#' for workflow-level comments
## This workflow implements a one-task workflow

# write the WDL version number 'version 1.0' -- 1
# possible to write 'WDL developent' as a version number as well
version 1.0

# create a workflow named 'HelloWorld' -- 2
workflow HelloWorld {

  # execute the 'WriteGreeting' task -- 3  
  call WriteGreeting
}

# create a task named 'WriteGreeting' -- 4
task WriteGreeting {

  # execute a command which runs 'echo "Hello"'  -- 5
  command {
    echo "Hello"
  }

  # set the output as a file named 'output_greeting' to standard out -- 6
  output {

     # write output to standard out
     File output_greeting = stdout()
  }
}
