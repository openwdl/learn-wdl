version 1.0

# pattern by @mlin
workflow foo {
    call assert { input: value= CONDITION_TO_CHECK,
                         msg = ERROR_MESSAGE }
}

task assert {
    Boolean value
    String msg

    command {
        if [ "${value}" == "false" ]; then
            echo $msg
            exit 1
        fi
        exit 0
    }
}