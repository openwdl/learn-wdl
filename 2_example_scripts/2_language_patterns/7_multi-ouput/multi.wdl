workflow MultiOutMultiIn {

  File firstInput

  call stepA { input: in=firstInput }
  call stepB { input: in=stepA.out }
  call stepC { input: in1=stepB.out1, in2=stepB.out2 }
}

task stepA {

  File in

  command { programA I=${in} O=outputA.ext }
  output { File out = "outputA.ext" }
}

task stepB {

  File in

  command { programB I=${in} O1=outputB1.ext O2=outputB2.ext }
  output {
    File out1 = "outputB1.ext"
    File out2 = "outputB2.ext" }
}

task stepC {

  File in1
  File in2

  command { programB I1=${in1} I2=${in2} O=outputC.ext }
  output { File out = "outputC.ext" }
}