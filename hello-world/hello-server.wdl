version 1.0

workflow test {
  call hello
}

task hello {
  String name

  command {
    echo 'Hello ${name}!'
  }
  output {
    File response = stdout()
  }
}


