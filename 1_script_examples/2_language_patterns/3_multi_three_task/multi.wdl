version 1.0

workflow MultiOutMultiIn {
    input {
        String firstInput
    }
    call StepA { input: in=firstInput }
    call StepB { input: in=StepA.out1 }
    call StepC { input: in1=StepB.out1, in2=StepB.out2 }
}

task StepA {
    input {
            String in
    }
    command { 
      # programA I=${in} O=outputA.ext 
      echo "${in}" > "outputA.txt"
    }
    output {  
      File out1 = "outputA.txt"
    }  
}

task StepB {
    input {
      String in
    }
  command { 
      # programB I=${in} O1=outputB1.ext O2=outputB2.ext 
       echo "${in}" > "outputB1.txt"
       echo "${in}" > "outputB2.txt"
  }
  output {
    File out1 = "outputB1.txt"
    File out2 = "outputB2.txt" 
  }
}

task StepC {
    input {
      String in1
      String in2
    }
    command { 
      # programC I1=${in1} I2=${in2} O=outputC.ext 
      echo "${in1}" > "outputC1.txt"
      echo "${in2}" > "outputC2.txt"
    }
    output { 
      File out1 = "outputC1.txt" 
    }
}
