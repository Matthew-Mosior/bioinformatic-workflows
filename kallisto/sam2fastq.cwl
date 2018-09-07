#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

baseCommand: [ "java", "-Xmx16g", "-jar", "/usr/bin/picard/picard.jar", "SamToFastq" ]

arguments:
  - valueFrom: reads.1.fastq
    position: 2
    prefix: FASTQ=
  - valueFrom: reads.2.fastq
    position: 3
    prefix: SECOND_END_FASTQ=
  - valueFrom: "LENIENT"
    position: 4
    prefix: "VALIDATION_STRINGENCY="


requirements:
  - class: DockerRequirement
    dockerImageId: zlskidmore/picard:2.18.12
    dockerPull: zlskidmore/picard:2.18.12
  - class: ResourceRequirement
    ramMin: 20000

inputs:
    bam_file:
        type: File
        inputBinding:
            position: 1
            prefix: I=

outputs:
  fastq1:
    type: File
    outputBinding:
      glob: reads.1.fastq
  fastq2:
    type: File
    outputBinding:
      glob: reads.2.fastq
