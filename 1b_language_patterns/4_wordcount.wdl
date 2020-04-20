version 1.0

workflow count_lines4_wf {
  input {
    Array[File] files
  }

  scatter(f in files) {
    call wc2_tool {
      input: file1=f
    }
  }
  
  output {
    wc2_tool.count
  }
}

task wc2_tool {
  input {
    File file1
  }

  command {
    wc ${file1}
  }

  output {
    Int count = read_int(stdout())
  }
}