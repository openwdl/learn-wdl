version 1.0
workflow glob {

 call glob_task  { }

 meta {
   author: "Brian O’Connor"
   email: "brian@somewhere.com"
   description: "a simple workflow that shows file globs to find outputs"
 }
}

task glob_task {

 command <<<
  for i in `seq 1 4`
  do echo 'testing globs in a WDL' > $i.output
  done
 >>>

 output {
     # the `*` designates multiple output file names based on a pattern
    Array[File] outputs = glob("*.output")
 }

 runtime {
   docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4"
   cpu: 1
   memory: "512 MB"
 }

}

