# This script has a syntax error - it's by design

version 1.0

workflow HelloWorld {
  call WriteGreeting
}

task WriteGreetings {
  command {
     echo "Hello World"
  }
  output {
     File output_greeting = stdout()
  }
  runtime {    
            docker: "ubuntu:latest"    
       } 
}
