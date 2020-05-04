version 1.0 

import "hello-task.wdl" as helloTask

workflow HelloWorld {
  input {
      String name
  }
  call helloTask.WriteGreeting {
    input:
      name = name
  }
}

