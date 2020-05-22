version 1.0

workflow SayItTwice {
   input {
     String name
   }
   call WriteGreeting {
      input:
         name = name
   }
   call ReadItBackToMe {
     input:
        written_name = WriteGreeting.output_name
  }
  output {
     File outfile = ReadItBackToMe.repeated_name
  }
}

task WriteGreeting {
  input {
     String name
  }

  command {
     echo "${name}"
  }
  output {
     File output_name = stdout()
  }
}

task ReadItBackToMe {
  input {
     File written_name
     String original_name = read_string(written_name)
  }

  command {
     echo "${original_name} to you too"
  }
  output {
     File repeated_name = stdout()
  }
}