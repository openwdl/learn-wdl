version 1.0

workflow SayItTwice {

  call WriteGreeting

  call ReadItBackToMe {
     input:
        written_greeting = WriteGreeting.output_greeting
  }

  output {
     File outfile = ReadItBackToMe.repeated_greeting
  }
}

task WriteGreeting {

  input {
     String greeting
  }

  command {
     echo "${greeting}"
  }
  output {
     File output_greeting = stdout()
  }
}

task ReadItBackToMe {

  input {
     File written_greeting
     String original_greeting = read_string(written_greeting)
  }

  command {
     echo "${original_greeting} to you too"
  }
  output {
     File repeated_greeting = stdout()
  }
}
