version 1.0

workflow foo {

    # optional
    String? username

    hello { input: who = username }
}

task hello {

    # optional
    String? who
    
    # default value is "dave.jones"
    String who_actual = select_first([who, "dave.jones"])

    command {
        echo "Hello, ${who_actual}"
    }
    output {
        String result = read_string(stdout())
    }
}