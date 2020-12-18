version 1.0

workflow bam_chrom_counter {
  input {
    File bam
    File bai
    Int num_chrom
  }
  scatter (i in range(num_chrom)) {
    String chrom = "chr~{i+1}"
    call samtools_count {
      input:
        bam = bam, bai = bai,
        region = chrom
    }
  }
  output {
    Array[Pair[String,Int]] counts = zip(chrom, samtools_count.count)
  }
}

task samtools_count {
  input {
    File bam
    File bai
    String? region
  }
  command <<<
    samtools view -c "~{bam}" "~{region}"
  >>>
  output {
    Int count = read_int(stdout())
  }
  runtime {
    docker: "biocontainers/samtools:v1.9-4-deb_cv1"
  }
  meta {
        author: "Mike Lin"
    }
}
