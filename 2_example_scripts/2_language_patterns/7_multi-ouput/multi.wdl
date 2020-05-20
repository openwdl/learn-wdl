version 1.0

workflow MultiOutMultiIn {
    input{
        File firstInput
    }
  call StepA { input: in=firstInput }
  call StepB { input: in=StepA.out }
  call StepC { input: in1=StepB.out1, in2=StepB.out2 }
}

task StepA {
    input{
            File in
        }
  

  command { programA I=${in} O=outputA.ext }
  output { File out = "outputA.ext" }
}

task StepB {
    input{
            File in
        }
  command { programB I=${in} O1=outputB1.ext O2=outputB2.ext }
  output {
    File out1 = "outputB1.ext"
    File out2 = "outputB2.ext" }
}

task StepC {
    input{
            File in1
            File in2
        }
  command { programB I1=${in1} I2=${in2} O=outputC.ext }
  output { File out = "outputC.ext" }
}