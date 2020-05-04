# write the version number 'version 1.0' -- 1
version 1.0

# create a workflow named 'HelloWorld' -- 5
workflow HelloWorld {
  # execute the 'WriteGreeting' task -- 6  
  call WriteGreeting
}

# create a task named 'WriteGreeting' -- 2
task WriteGreeting {

  # execute a command which runs 'echo "Hello"'  -- 3
  command {
     echo "Hello"
  }

  # set the output as a file named 'output_greeting' to standard out -- 4
  output {
     # Write output to standard out
     File output_greeting = stdout()
  }
}
