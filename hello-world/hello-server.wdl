version 1.0

workflow HelloServer {
  call WriteGreeting
}

task WriteGreeting {
  String name

  command {
    echo 'Hello ${name}!'
  }
  output {
    File response = stdout()
  }
}


