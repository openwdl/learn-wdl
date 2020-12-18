version 1.0

workflow vcf_chrom_counter {
  input {
    File vcf_gz
    File tbi
    Int num_chrom = 22
  }
  scatter (i in range(num_chrom)) {
    String chrom = "chr~{i+1}"
    call tabix_count {
      input:
        vcf_gz = vcf_gz, tbi = tbi,
        region = chrom
    }
  }
  output {
    Array[Pair[String,Int]] counts = zip(chrom, tabix_count.count)
  }
}

task tabix_count {
  input {
    File vcf_gz
    File tbi
    String? region
  }
  command <<<
    tabix "~{vcf_gz}" "~{region}" | wc -l
  >>>
  output {
    Int count = read_int(stdout())
  }
  runtime {
    docker: "biocontainers/tabix:v1.9-11-deb_cv1"
  }
}
