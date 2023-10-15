BATCHFILE ?= batchFile_FASTQ_testdata.csv
# RESULTDIR ?= RESULT

DATA_NAME = $(shell echo $(BATCHFILE) | rev | cut -d'_' -f1 | rev | cut -d'.' -f1)
RESULTDIR = RESULT_$(DATA_NAME)

all:
	@echo "BATCHFILE: $(BATCHFILE)"
	@echo "RESULTDIR: $(RESULTDIR)"

hello:
	echo "RESULTDIR=$(RESULTDIR)"
	echo "Hello, Makefile"
	echo "This line will print if the file hello does not exist."

dev:
	@echo "Running dev command on testdata:"
	NXF_VER=22.10.8 nextflow run nextNEOpi.nf \
		--batchFile testdata_batchFile_FASTQ.csv \
    	-profile singularity \
		-config conf/params.config \
		--outputDir 'RESULT_testdata' \
		--accept_license \
		--TCR false \
		--CNVkit false \
		-resume

run:
	@echo "Running command on data:"
	NXF_VER=22.10.8 nextflow run nextNEOpi.nf \
		--batchFile $(BATCHFILE) \
    	-profile singularity \
		-config conf/params.config \
		--outputDir '$(RESULTDIR)' \
		--accept_license \
		--TCR false \
		--CNVkit false \

resume:
	@echo "Resuming on data:"
	NXF_VER=22.10.8 nextflow run nextNEOpi.nf \
		--batchFile $(BATCHFILE) \
    	-profile singularity \
		-config conf/params.config \
		--outputDir '$(RESULTDIR)' \
		--accept_license \
		--TCR false \
		--CNVkit false \
		-resume