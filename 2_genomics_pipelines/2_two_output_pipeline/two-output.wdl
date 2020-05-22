version 1.0

workflow ga4ghMd5 {

    File inputFile
    String knownMd5Sum

    call md5 { input: inputFile=inputFile }
    call checkMd5 { input: inputFile1=md5.file1,inputFile2=md5.file2,knownMd5Sum=knownMd5Sum }

    meta {
    author: "Brian O’Connor"
    email: "brian@somewhere.com"
    description: "a simple workflow that calculates an md5 checksum and then checks it"
    }

}

task md5 {
    File inputFile

    command <<<
        /bin/my_md5sum ${inputFile}
        md5sum ${inputFile} | awk '{print $1}' > md5sum.2.txt
    >>>

    output {
        File file1 = "md5sum.txt"
        File file2 = "md5sum.2.txt"
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

task checkMd5 {
    File inputFile1
    File inputFile2
    String knownMd5Sum

    command {
        grep ${knownMd5Sum} ${inputFile1} | wc -l > check_md5sum.report.txt
        grep ${knownMd5Sum} ${inputFile2} | wc -l >> check_md5sum.report.txt
    }

    output {
        File value = "check_md5sum.report.txt"
    }

    runtime {
    docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4"
    cpu: 1
    memory: "512 MB"
    }

    parameter_meta {
        inputFile1: "the first file to create an md5 checksum for"
        inputFile2: "the second file to create an md5 checksum for"
        knownMd5Sum: "the known md5sum value to compare against"
    }

}


