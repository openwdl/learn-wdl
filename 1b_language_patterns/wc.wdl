version 1.0

task WC {
    input {
        File file1
    }

    # TODO: Implement split by word
    command <<<
        cat ${sep=" " inputFiles} > single_md5_file.txt
        md5sum single_md5_file.txt | awk '{print $1}' > md5sum.report.txt
    >>>
    
    # TODO: Implement k-v property bag output
    output {
        Array[String] outArray = read_words(stdout())
    }

    runtime {
        memory: 1
    }
}