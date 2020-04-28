## using the 'version 1.0' tag causes a runtime error

import "hello-task.wdl" as helloTask

workflow HelloWorld {
  call helloTask.WriteGreeting
}


