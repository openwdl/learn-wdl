## To Verify and Run 

#### List Input / Output Parameters

```
miniwdl run pipes/WDL/workflows/assemble_refbased.wdl
```

#### Lint WDL

- Tip: Fix syntax errors

```
miniwdl check pipes/WDL/workflows/assemble_refbased.wdl
```

#### Run Example

- Tip: Can use `--input` flag with `inputs.json` file rather than direct variable assignment
- Tip: remove `--verbose` flag to reduce log output
- Tip: can use `--debug` flag to increase log output

```
miniwdl run pipes/WDL/workflows/assemble_refbased.wdl   \
    reads_unmapped_bams=test/input/G5012.3.testreads.bam  \
    reference_fasta=test/input/ebov-makona.fasta          \
    sample_name=G5012.3 --verbose
```

#### Viz Workflow Graph

- source code [here](https://github.com/chanzuckerberg/miniwdl/blob/842cb847cb09a4412cda6103c1b60ceb93b18a9c/examples/wdlviz.py)
- requires `graphiz` - install `pip install graphviz`

