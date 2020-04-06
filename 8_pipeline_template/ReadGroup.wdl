version 1.0
# Copyright (c) 2018 Sequencing Analysis Support Core - Leiden University Medical Center
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import "Structs.wdl" as structs

workflow readgroup {
    input {
        Readgroup readgroup
        String outputDir
    }

    call echo {
        input:
            r1 = readgroup.reads.R1,
            r2 = readgroup.reads.R2,
            id = readgroup.id,
            outputFile = outputDir + "/echo.out"
    }

    output {
        # REPLACE THESE WITH REAL OUTPUTS
        File inputR1 = readgroup.reads.R1
        File? inputR2 = readgroup.reads.R2
        File out = echo.out
    }

}

# BELOW IS A MOCK TASK IN ORDER TO TEST THE PIPELINE THIS CAN BE REMOVED.
task echo {
    input {
        String r1
        String? r2
        String id
        String outputFile = "echo.out"
    }

    command {
        mkdir -p $(dirname ~{outputFile})
        echo R1: ~{r1} > ~{outputFile}
        echo R2: ~{r2} >> ~{outputFile}
        echo id: ~{id} >> ~{outputFile}
    }

    output {
        File out = outputFile
    }
}
