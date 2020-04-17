version 1.0

workflow ga4ghMd5 {

    Array[File] inputFiles

    scatter (oneFile in inputFiles) {
    call md5 { input: inputFile=oneFile }
    }
    call md5ofmd5s { input: inputFiles=md5.value }

    meta {
    author: "Brian O’Connor"
    email: "brian@somewhere.com"
    description: "a simple workflow that scatters to calculate md5 checksums and then calculates and overall checksum on the individual checksums."
    }

}

task md5 {
    File inputFile

    command {
        /bin/my_md5sum ${inputFile}
    }

    output {
        File value = "md5sum.txt"
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

task md5ofmd5s {

    Array[File] inputFiles

    command <<<
        cat ${sep=" " inputFiles} > single_md5_file.txt
        md5sum single_md5_file.txt | awk '{print $1}' > md5sum.report.txt
    >>>

    output {
        File value = "md5sum.report.txt"
    }

    runtime {
    docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4"
    cpu: 1
    memory: "512 MB"
    }

    parameter_meta {
        inputFiles: "the files to cat and then create an md5 checksum for"
    }

}


