version 1.0
import "hello-task.wdl" as HelloTask

workflow HelloWorldWithDocker {
       call HelloTask.WriteGreeting
       call HelloTask.WriteGreeting as wg
}
       

