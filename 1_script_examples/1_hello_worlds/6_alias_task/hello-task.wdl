version 1.0
workflow HelloTask {
        call WriteGreeting as wg1
        call WriteGreeting as wg2
      }
task WriteGreeting {
       command {
            echo "Hello Docker"
       }
       output {
            File output_greeting = stdout()
       }
       runtime {
            docker: "ubuntu:latest"
       }
}
