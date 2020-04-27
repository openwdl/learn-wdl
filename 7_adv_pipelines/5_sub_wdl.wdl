version 1.0

workflow hello_and_goodbye {
  String hello_and_goodbye_input

  call hello {input: addressee = hello_and_goodbye_input }
  call goodbye {input: addressee = hello_and_goodbye_input }

  output {
    String hello_output = hello.salutation
    String goodbye_output = goodbye.salutation
  }

task hello {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
}

task goodbye {
  String addressee
  command {
    echo "Goodbye ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
}


}