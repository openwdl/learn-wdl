version 1.0

# pattern by @mlin
workflow foo {
    input {
        Boolean CONDITION_TO_CHECK
        String ERROR_MESSAGE 
    }
    call assert { input: value= CONDITION_TO_CHECK,
                         msg = ERROR_MESSAGE }
}

task assert {
    input {
        Boolean value
        String msg
    }
    
    # if input is "true", then 0; else if input is "false", then result 1
    command {
        if [ "${value}" == "false" ]; then
            echo $msg
            exit 1
        fi
        exit 0
    }
}