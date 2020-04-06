version 1.0

workflow BlastnWorkflow {
   String path
   call Blastn {
      input: path=path
   }
}

task Blastn {
   String path

   command {
      bash blast.sh ${path}
   }

   output {
      File blastn_report = "out.txt"
   }

   runtime {
      docker: "registry.dockerhub.com/lynnlangit/blastn:latest"
   }
}
