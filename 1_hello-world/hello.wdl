version 1.0

workflow HelloWorld {
  call WriteGreeting
}

task WriteGreeting {
  command {
     echo "Hello"
  }
  output {
     File output_greeting = stdout()
  }
}
