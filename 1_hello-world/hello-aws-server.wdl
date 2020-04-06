version 1.0

workflow HelloAWS {
    call WriteGreeting
}

task WriteGreeting {
    command {
        echo "Hello AWS!"
    }
    runtime {
        docker: "ubuntu:latest"
    }

}


