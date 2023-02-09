version 1.0

workflow FastQC {
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
}

task fastqc {
	input {
		Array[File] fastqs
		Int addldisk = 10
		Int cpu = 4
		Int memory = 8
		Int preempt = 1 
	}
	Int finalDiskSize = addldisk + ceil(size(fastqs))

	command <<<
		fastqc ~{sep=" " fastqs}
	>>>

	runtime {
		cpu: cpu
		docker: "ashedpotatoes/iqbal-unofficial-clockwork-mirror:v0.11.3"
		disks: "local-disk " + finalDiskSize + " SSD"
		memory: "${memory} GB"
		preemptible: "${preempt}"
	}

	output {
		Array[File] reports = glob("*.html")
	}
	
}