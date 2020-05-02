version 1.0

workflow HelloTask {
   # Lines 5-7 are optional. Added for readability
   input {
      String name
   }
   call WriteGreeting 
}

task WriteGreeting {
   input {
      String name
   }
  command {
    echo 'hello ${name}!'
  }
  output {
    File response = stdout()
  }
}


