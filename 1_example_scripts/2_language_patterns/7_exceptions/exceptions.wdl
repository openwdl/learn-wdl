version 1.0

# pattern by @jtratner
workflow show_error {

    call make_error {
    }
}

# This task will always return an error
# Lines 14-18 run a BASH script, hostname is populated via BASH
task make_error {
    command <<<
        echo '{
                "error": {
                    "type": "AppError", "message": "x must be at least 2' $(hostname)'"
                }
        }' > job_error.json
        exit 1
    >>>
}