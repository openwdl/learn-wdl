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

version 1.0

import "Library.wdl" as libraryWorkflow
import "Structs.wdl" as structs

workflow sample {
    input {
        Sample sample
        String outputDir
    }

    # Do the work per library.
    # Modify library.wdl to change what is happening per library.
    scatter (library in sample.libraries) {
        call libraryWorkflow.library as libraryWorkflow {
            input:
                outputDir = outputDir + "/lib_" + library.id,
                library = library
            }
        }

    # Do the per sample work and the work over all the library
    # results below this line.
    output {
        # REPLACE WITH REAL OUTPUTS
        Array[File] out = flatten(libraryWorkflow.out)
    }
}
