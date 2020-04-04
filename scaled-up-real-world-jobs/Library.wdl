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

import "readgroup.wdl" as readgroupWorkflow
import "structs.wdl" as structs

workflow library {
    input {
        Library library
        String outputDir
    }

    # The jobs that are done per readgroup.
    # Modify readgroup.wdl to change what is happening per readgroup
    scatter (readgroup in library.readgroups) {
        call readgroupWorkflow.readgroup as readgroupWorkflow {
            input:
                outputDir = outputDir + "/rg_" + readgroup.id,
                readgroup = readgroup
        }

    }

    # Add the jobs that are done per library and over the results of
    # all the readgroups below this line.

    output {
        # REPLACE WITH REAL OUTPUTS
        Array[File] out = readgroupWorkflow.out
    }
}
