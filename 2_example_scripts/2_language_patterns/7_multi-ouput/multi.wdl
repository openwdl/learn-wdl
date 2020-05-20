version 1.0

workflow MultiOutMultiIn {
    input {
        File firstInput
    }
    call StepA { input: in=firstInput }
    call StepB { input: in=StepA.out1 }
    call StepC { input: in1=StepB.out1, in2=StepB.out2 }

    output {
        File outfile = StepC.out1
    }
}

task StepA {
    input {
            File in
    }
    command { 
      # programA I=${in} O=outputA.ext 
      cat ${in} > outputA.txt
    }
    output { 
      File out1 = "outputA.ext" 
    }
    runtime {    
            continueOnReturnCode: 127
    }   
}

task StepB {
    input {
      File in
    }
  command { 
      # programB I=${in} O1=outputB1.ext O2=outputB2.ext 
       cat ${in} > outputB1.txt
       cat ${in} > outputB2.txt
  }
  output {
    File out1 = "outputB1.txt"
    File out2 = "outputB2.txt" 
  }
  runtime {     
            continueOnReturnCode: 127
    }   
}

task StepC {
    input {
      File in1
      File in2
    }
    command { 
      # programB I1=${in1} I2=${in2} O=outputC.ext 
      cat ${in1} > outputC1.txt
      cat ${in2} > outputC2.txt
    }
    output { 
      File out1 = "outputC.ext" 
    }
    runtime {    
            continueOnReturnCode: 127
    }   
}