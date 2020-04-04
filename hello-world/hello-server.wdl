version 1.0

workflow helloServer {
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


