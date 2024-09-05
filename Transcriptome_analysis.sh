
#Transcriptome analysis

#(1) Reads were then aligned to the R. ferrumequinum reference genome using HISAT2 software (version: 2.2.1)
hisat2 -p 8 -t -x $refindex -1 left.fq.gz -2 right.fq.gz --no-unal --un-conc hisat  --dta-cufflinks | samtools view -bS  - >TR.bam
samtools sort TR.bam accepted_hits

#(2) The fragments per kilobase of transcript per million mapped reads (FPKM) were computed for each gene.
python -m HTSeq.scripts.count -m union -s no -t exon -f bam accepted_hits.bam Rfer.gtf >out.readcount
perl ./script/calRPKM.v2.pl out.readcount Rfer.gtf out.fpkm

#(3) Identifying DEGs using DESeq2
https://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#differential-expression-analysis



