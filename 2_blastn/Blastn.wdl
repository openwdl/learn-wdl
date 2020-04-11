version 1.0

workflow BlastnWorkflow {
   String path
   call Blastn {
      input: path=path
   }
}

task Blastn {
   String path

   # Container image includes `blast.sh` shell script
   command {
      bash blast.sh ${path}
   }

   output {
      File blastn_report = "out.txt"
   }

   runtime {
      # pull container image from DockerHub
      docker: "registry.dockerhub.com/lynnlangit/blastn:latest"
   }
   meta {
        author: "Lynn Langit"
    }
}
