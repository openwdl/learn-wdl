version 1.0

workflow TimingWorkflow {
	scatter(i in range(15)) {
		call Sleep { input: sleep_time = i }
	}
}

task Sleep {
	Int sleep_time
	command {
		echo "I slept for ${sleep_time}"
		Sleep ${sleep_time}
	}
	output {
		String out = read_string(stdout())
	}
}
