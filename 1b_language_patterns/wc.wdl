version 1.0

task WC {
    input {
        File file1
    }

    # TODO: Implement split by word
    command <<<
        python mapper.py --file=${file1} 
    >>>
    
    # TODO: Implement k-v property bag output
    output {
        Array[String] outArray = read_words(stdout())
    }

    runtime {
        memory: 1
    }
}

