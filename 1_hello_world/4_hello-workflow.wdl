version 1.0 

import "4_hello-task.wdl" as helloTask

workflow HelloWorld {
  input {
      String name
  }
  call helloTask.WriteGreeting {
    input:
      name = name
  }
}

