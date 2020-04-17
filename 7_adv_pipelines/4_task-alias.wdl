version 1.0

workflow ga4ghMd5Twice {

    File inputFile

    call md5 as firstMd5 { input: inputFile=inputFile }
    call md5 as secondMd5 { input: inputFile=inputFile }
    call md5ofmd5s { input: inputFiles=[firstMd5.value,secondMd5.value] }

    meta {
    author: "Brian O’Connor"
    email: "brian@somewhere.com"
    description: "a simple workflow that calculates an md5 checksum twice and then creates an md5sum of those checksums."
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


