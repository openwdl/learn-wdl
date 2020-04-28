## using the 'version 1.0' tag causes a runtime error
## note: this task description does NOT include a workflow
## to run this task, reference it (using the 'import' statement and 'call' it)

task WriteGreeting {
  command {
     echo "Hello"
  }
  output {
     # Write output to standard out
     File output_greeting = stdout()
  }
}
