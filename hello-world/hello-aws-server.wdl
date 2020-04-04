version 1.0

workflow printHelloAndGoodbye {
    call echoHello
}

task echoHello{
    command {
        echo "Hello AWS!"
    }
    runtime {
        docker: "ubuntu:latest"
    }

}


