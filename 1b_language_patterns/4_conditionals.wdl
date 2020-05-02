version 1.0

workflow ga4ghMd5Conditional {
 input {
    File inputFile
 }

 call md5 { input: inputFile=inputFile }
 # conditional
 if (md5.value == "00579a00e3e7fa0674428ac7049423e2") {
   call sha256 { input: inputFile=inputFile }
 }

 meta {
   author: "Brian O’Connor"
   email: "brian@somewhere.com"
   description: "a simple workflow that calculates an md5 checksum"
 }

}

task md5 {
  input {
    File inputFile
  }

  command {
    /bin/my_md5sum ${inputFile}
  }

 output {
    # using read_string method
    String value = read_string("md5sum.txt")
 }

 runtime {
   docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4"
   cpu: 1
   memory: "512 MB"
 }

 parameter_meta {
    inputFile: "the file to create an md5 checksum for"
 }

}

task sha256 {
  input {
    File inputFile
  }

  command {
    sha256sum ${inputFile} > sha256.txt
  }

 output {
    String value = read_string("sha256.txt")
 }

 runtime {
   docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4"
   cpu: 1
   memory: "512 MB"
 }

 parameter_meta {
    inputFile: "the file to create an sha256 checksum for"
 }

}
