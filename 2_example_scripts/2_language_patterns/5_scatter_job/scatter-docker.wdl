version 1.0

workflow TimingWorkflow {
	input {
		Int sleep_time
	}
	# scatter keyword parallelizes this Sleep task execution
	scatter(i in range(15)) {
		call Sleep { input: sleep_time = i }
	}
}

task Sleep {
	input {
		Int sleep_time
	}
	command {
		echo "I slept for ${sleep_time}"
		Sleep ${sleep_time}
	}
	output {
		String out = read_string(stdout())
	}
	runtime {    
            docker: "ubuntu:latest"  
			# keep going even if Sleep command isn't found in PATH variable
            continueOnReturnCode: 127
    }   

}

     