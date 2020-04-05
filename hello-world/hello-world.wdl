version 1.0

workflow HelloWorldWithDocker {

       call WriteGreeting 
}  
       
task WriteGreeting {
       command {      
            echo "Hello World"
       }
       output {      
            File output_greeting = stdout()
       }
       runtime {       
            docker: "lynnlangit/blastn:latest"    
       } 
}
