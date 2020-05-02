version 1.0

import "4_hello-task.wdl" as helloTask

workflow HelloWorld {
  call helloTask.WriteGreeting
}


