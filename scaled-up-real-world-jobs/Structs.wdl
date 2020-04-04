version 1.0

import "tasks/common.wdl" as common

struct Readgroup {
    String id
    FastqPair reads
}

struct Library {
    String id
    Array[Readgroup] readgroups
}

struct Sample {
    String id
    Array[Library] libraries
}

struct SampleConfig {
    Array[Sample] samples
}
