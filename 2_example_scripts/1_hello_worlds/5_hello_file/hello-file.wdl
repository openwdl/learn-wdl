version 1.0

workflow HelloFile {
    input {
        File file_input
        Int mem_gb
    }

    call InputFile { input: file_input=file_input, mem_gb=mem_gb }
}

task InputFile {
    input {
      File file_input
      Int mem_gb
    }
    command {
        bash echo 'The file is ${file_input}!' ${mem_gb}
    }
    output {
        File result = stdout()
    }
    runtime {
        docker: "ubuntu:latest"    
        memory: mem_gb + "GB"
        # keep going even ...
        continueOnReturnCode: 126
    }
}