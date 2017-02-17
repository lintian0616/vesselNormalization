# Download Genome Sequence and Annotation

cd $GenomesRef
wget ftp://ftp.ensembl.org/pub/release-83/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
gunzip Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
wget ftp://ftp.ensembl.org/pub/release-83/gtf/mus_musculus/Mus_musculus.GRCm38.83.chr.gtf.gz
gunzip Mus_musculus.GRCm38.83.chr.gtf.gz

# Build Genome Reference

cd $RSEM_Idx
## set sjdboverhang 75 (read length - 1)
rsem-prepare-reference -p 8 --gtf /$GenomesRef/Mus_musculus.GRCm38.83.chr.gtf --star --star-sjdboverhang 74 $Genomesref/Mus_musculus.GRCm38.dna.primary_assembly.fa GRCm38
rsem-calculate-expression --star -p 8 --star-gzipped-read-file --output-genome-bam --calc-ci --estimate-rspd --quiet --phred33-quals --paired-end sample_R1.fastq.gz sample_R2.fastq.gz $RSEM_Idx/GRCm38 sample_RSEM

