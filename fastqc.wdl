version 1.0

workflow FastqcWF {
	input {
		Array[File] fastqs
	}

	call fastqc {
		input:
			fastqs = fastqs
	}

	output {
		Array[File] reports = fastqc.reports
	}

	meta {
		author: "Ash O'Farrell"
	}
}

task fastqc {
	input {
		Array[File] fastqs
		Int addldisk = 10
		Int cpu = 4
		Int memory = 8
		Int preempt = 1 
	}
	Int finalDiskSize = addldisk + ceil(size(fastqs), "GB")

	command <<<
		mkdir outs
		fastqc -o outputs ~{sep=" " fastqs}
	>>>

	runtime {
		cpu: cpu
		docker: "biocontainers/fastqc:v0.11.9_cv8"
		disks: "local-disk " + finalDiskSize + " SSD"
		memory: "${memory} GB"
		preemptible: "${preempt}"
	}

	output {
		Array[File] reports = glob("outputs/*.html")
	}
	
}