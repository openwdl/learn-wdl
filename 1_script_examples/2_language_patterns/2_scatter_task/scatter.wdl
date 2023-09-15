version 1.0

workflow TimingWorkflow {
	input {
		Int in_sleep_time
	}
	# scatter keyword parallelizes this Sleep task execution
	scatter(i in range(in_sleep_time)) {
		call Sleep { input: sleep_time = i }
	}
	output {
		Array[String] outputs = Sleep.out
}

task Sleep {
	input {
		Int sleep_time
	}
	command {
		echo "I slept for ${sleep_time}"
		sleep ${sleep_time}
	}
	output {
		String out = read_string(stdout())
	}
}

     
