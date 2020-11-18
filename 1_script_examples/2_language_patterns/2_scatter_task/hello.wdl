version 1.0 

workflow HelloWorld {
  scatter(i in range(15)) {
		call WriteGreeting 
	}
  
}

task WriteGreeting {
  command {
     echo "Hello Scattered World"
  }
  output {
     File output_greeting = stdout()
  }
}
