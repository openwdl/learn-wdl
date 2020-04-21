version 1.0
version 1.0

import "wc.wdl" as WC

workflow WordCount {
  input {
    Array[File] files
  }

  scatter(f in files) {
    call Mapper {
      input: file1=f
    }
  }
  
  # TODO: Implement reducer-script
  output {
    Mapper.reduceCount
  }
}

task Mapper {
  input {
    File file1
  }

  # TODO: Implement mapper-script
  command {
    WC ${mapper-script}
  }

  output {
    Int count = read_int(stdout())
  }
}