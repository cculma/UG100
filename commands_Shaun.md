# notes of comands used

## this a draft file to keep record of the commands tested
1  101 1050
2 1101 2050
3 2101 3050


CRAM=//project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01/haplo_01.fa



#!/bin/bash
#SBATCH --job-name="UG01"   #name of this job
#SBATCH -p ceres              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 80                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 5-00:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov   # email address
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -A xu_alfalfabreeding # name of the slurm account - same as the SCINet project name
#SBATCH -o "stdout.%j.%N"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, prints our standard error
date                          #optional, prints out timestamp at the start of the job in stdout file

module load bwa_mem2
module load samtools

./01_cram_fastq.sh


421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram.aligned_raw.bam
421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram


/project/xu_alfalfabreeding/system_from_home/msi/Silphium/scripts01
$TMPDIR

## Progress 2026-04-30


/project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files


cp -r haplo_01_mem2 ../../../../../../90daydata/xu_alfalfabreeding/system_from_home/msi/

cp 421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram ../../../../../../90daydata/xu_alfalfabreeding/system_from_home/msi/

cp -r 02_files ../../../../../../90daydata/xu_alfalfabreeding/system_from_home/msi/

cp -r 03_pipeline ../../../../../../90daydata/xu_alfalfabreeding/system_from_home/msi/

cd ../../../../../../90daydata/xu_alfalfabreeding/system_from_home/msi/

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files


CRAM=/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa


ls /reference/containers

## Sentieon® Genomics is a commercial sowtware. The other option os ti use Deep Variant.


Deep Variant, using Docker

https://scinet.usda.gov/guides/software/singularity


## install deepvariant in scinet

https://github.com/google/deepvariant/blob/r1.10/docs/deepvariant-quick-start.md

cd # home

[user.name@ceres \~]$ salloc -A xu_alfalfabreeding

[user.name@ceres20-compute-44 ]$ module load apptainer

#[user.name@sceres20-compute-44 \~]$ apptainer pull docker://r-base # example

BIN_VERSION="1.10.0"

[user.name@sceres20-compute-44 \~]$ apptainer pull docker://google/deepvariant:"${BIN_VERSION}"


df -h \~

Filesystem                            Size  Used Avail Use% Mounted on

vast-vip1.vast.scinet.usda.gov:/home   91T   13T   79T  14% /home



# running job_deepvariant.sh produces the deepvariant_1.10.0.sif

[user.name@ceres \~]$ salloc -A xu_alfalfabreeding

INPUT_DIR="${PWD}/quickstart-testdata"
DATA_HTTP_DIR="https://storage.googleapis.com/deepvariant/quickstart-testdata"

mkdir -p ${INPUT_DIR}
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/NA12878_S1.chr20.10_10p1mb.bam
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/NA12878_S1.chr20.10_10p1mb.bam.bai
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.bed
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.vcf.gz
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.vcf.gz.tbi
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta \\
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.fai \\
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz \\
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz.fai \\
wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz.gzi \\


ls -1 ${INPUT_DIR}




OUTPUT_DIR="${PWD}/quickstart-output"

mkdir -p "${OUTPUT_DIR}"


module load apptainer
apptainer inspect --runscript deepvariant_1.10.0.sif


"/opt/deepvariant/bin/run_deepvariant" "--help"



# Run DeepVariant.

apptainer run -B /usr/lib/locale/:/usr/lib/locale/ \\

&#x20; docker://google/deepvariant:"${BIN_VERSION}" \\

&#x20; /opt/deepvariant/bin/run_deepvariant \\

&#x20; --model_type=WGS \\ \*\*Replace this string with exactly one of the following \[WGS,WES,PACBIO,ONT_R104,HYBRID_PACBIO_ILLUMINA]\*\*

&#x20; --vcf_stats_report=true \\

&#x20; --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta \\

&#x20; --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam \\

&#x20; --regions "chr20:10,000,000-10,010,000" \\

&#x20; --output_vcf="${OUTPUT_DIR}"/output.vcf.gz \\

&#x20; --output_gvcf="${OUTPUT_DIR}"/output.g.vcf.gz \\

&#x20; --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir" \\ \*\*Optional.

&#x20; --num_shards=2 \\ \*\*How many cores the `make_examples` step uses. Change it to the number of CPU cores you have.\*\*

INPUT_DIR="${PWD}/quickstart-testdata"

OUTPUT_DIR="${PWD}/quickstart-output"

mkdir -p "${OUTPUT_DIR}"



apptainer run deepvariant_1.10.0.sif -v "${INPUT_DIR}":"/input" -v "${OUTPUT_DIR}":"/output" --model_type=WGS --vcf_stats_report=true --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam --regions "chr20:10,000,000-10,010,000" --output_vcf="${OUTPUT_DIR}"/output.vcf.gz --output_gvcf="${OUTPUT_DIR}"/output.g.vcf.gz --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir" --num_shards=2

export APPTAINER_CACHEDIR=$TMPDIR \\

export APPTAINER_TMPDIR=$TMPDIR \\



INPUT_DIR="${PWD}/quickstart-testdata"

OUTPUT_DIR="${PWD}/quickstart-output"

BIN_VERSION="1.10.0"

apptainer run -B /usr/lib/locale/:/usr/lib/locale/ \

&#x20; docker://google/deepvariant:"${BIN_VERSION}" \

&#x20; /opt/deepvariant/bin/run_deepvariant \

&#x20; --model_type=WGS \\ \*\*Replace this string with exactly one of the following \[WGS,WES,PACBIO,ONT_R104,HYBRID_PACBIO_ILLUMINA]\*\*

&#x20; --vcf_stats_report=true \\

&#x20; --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta \\

&#x20; --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam \\

&#x20; --regions "chr20:10,000,000-10,010,000" \\

&#x20; --output_vcf="${OUTPUT_DIR}"/output.vcf.gz \\

&#x20; --output_gvcf="${OUTPUT_DIR}"/output.g.vcf.gz \\

&#x20; --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir" \\ \*\*Optional.

&#x20; --num_shards=1 \\ \*\*How many cores the `make_examples` step uses. Change it to the number of CPU cores you have.\*\*



module load python
module load python_3/3.13.7

Please upgrade to the latest Python version, or at least Python 3.11, to continue receiving updates for google.api_core past that date.

2026-04-30 13:56:08.764680: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:38] TF-TRT Warning: Could not find TensorRT

\--ref is required.

Pass --helpshort or --helpfull to see help on flags.

./test01.sh: line 12: --vcf_stats_report=true: command not found

./test01.sh: line 18: make_examples: command not found

./test01.sh: line 18: --num_shards=1: command not found

\--num_shards

\--make_examples_extra_args



/project/xu_alfalfabreeding/system_from_home/msi/UG100/03_pipeline/--ref=/project/xu_alfalfabreeding/system_from_home/msi/UG100/03_pipeline/quickstart-testdata/ucsc.hg19.chr20.unittest.fasta: no such file or directory


## works ok
Run DeepVariant with "--cleanenv"

apptainer run --cleanenv -B /usr/lib/locale/:/usr/lib/locale/ \
 docker://google/deepvariant:"${BIN_VERSION}" \
 /opt/deepvariant/bin/run_deepvariant \
 --model_type=WGS \
 --vcf_stats_report=true \
 --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta \
 --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam \

&#x20; --regions "chr20:10,000,000-10,010,000" \\

&#x20; --output_vcf="${OUTPUT_DIR}"/output.vcf.gz \\

&#x20; --output_gvcf="${OUTPUT_DIR}"/output.g.vcf.gz \\

&#x20; --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir" \\ \*\*Optional.

&#x20; --num_shards=1 \\



#apptainer run -B /usr/lib/locale/:/usr/lib/locale/ \\
#  docker://google/deepvariant:"${BIN_VERSION}" \\
#  /opt/deepvariant/bin/run_deepvariant \\
#  --model_type=WGS \\ \*\*Replace this string with exactly one of the following \[WGS,WES,PACBIO,ONT_R104,HYBRID_PACBIO_ILLUMINA]\*\*
#  --vcf_stats_report=true \\
#  --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta \\
#  --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam \\
#  --regions "chr20:10,000,000-10,010,000" \\
#  --output_vcf="${OUTPUT_DIR}"/output.vcf.gz \\
#  --output_gvcf="${OUTPUT_DIR}"/output.g.vcf.gz \\
#  --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir" \\ \*\*Optional.
#  --num_shards=1 \\ \*\*How many cores the `make_examples` step uses. Change it to the number of CPU cores you have.\*\*



INPUT_DIR="${PWD}/quickstart-testdata"

"${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta


/project/xu_alfalfabreeding/system_from_home/msi/UG100/03_pipeline/quickstart-testdata
/project/xu_alfalfabreeding/system_from_home/msi/UG100/03_pipeline/quickstart-output
quickstart-testdata
quickstart-output

# --model_type: <WGS|WES|PACBIO|ONT_R104|HYBRID_PACBIO_ILLUMINA|MASSEQ|RNASEQ>

\--model_type: <WGS|WES|PACBIO|ONT_R104|HYBRID_PACBIO_ILLUMINA|MASSEQ|RNASEQ>: Required. Type of model to use for variant calling. Set this flag to use the default model



docker pull ultimagenomics/ugbio_filtering:1.22.0
apptainer pull ultimagenomics/alignment:4.0
apptainer pull alpine.sif docker://alpine:latest
apptainer pull alignment.sif docker://ultimagenomics/alignment:4.0
apptainer pull ugbio_filtering.sif docker://ultimagenomics/ugbio_filtering:1.22.0


CRAM=//project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa

CRAM=/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa

/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts
/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output

#SBATCH --job-name=UG100_Pipeline
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --partition=gpu  # DeepVariant is much faster on a GPU node
#SBATCH --gres=gpu:1     # Request 1 GPU


module load apptainer

srun -A scinet_workshop1 -t 00:30:00 -n 1 --mem 8G --pty bash

--reservation=workshop --gres=gpu:1 --mem=32G --ntasks-per-node=4


#!/bin/bash

#SBATCH --partition=rouge
#SBATCH --gres=gpu:8
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=48
#SBATCH --mem-per-cpu=512G
#SBATCH --output=job_%j.out
module load rocm
module load <your-gpu-software>
srun your_gpu_program

## progress on 2026/05/01

## to change bewteen ceres to altlas
/project/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas


INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas"


salloc -A xu_alfalfabreeding
module load apptainer

apptainer exec -B $BIND_PATH alignment.sif
apptainer run alignment.sif

FATAL:   while executing starter: while executing /apps/spack-managed-x86_64_v3-v1.1/gcc-11.5.0/apptainer-1.4.3-gjmkxcehl4zeatqaag3ukwzmb75g77xz/libexec/apptainer/bin/starter-suid: permission denied
[cesar.medinaculma@atlas-login-2 06_atlas]$ 


INPUT_DIR="${PWD}/quickstart-testdata"
OUTPUT_DIR="${PWD}/quickstart-output"
mkdir -p "${OUTPUT_DIR}"

apptainer inspect --runscript deepvariant_1.10.0.sif
apptainer run deepvariant_1.10.0.sif

apptainer inspect --runscript alignment.sif

sudo docker run --gpus 1 \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}:/output" \
  google/deepvariant:"${BIN_VERSION}-gpu" \
  /opt/deepvariant/bin/run_deepvariant \
  ...

# Run DeepVariant with "--cleanenv"

singularity run  --gpus 1 --cleanenv -B /usr/lib/locale/:/usr/lib/locale/ \
  docker://google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  ...

# Run an image with GPU support
singularity run --nv my_image.sif

apptainer run --nv deepvariant_1.10.0.sif
apptainer run 02_pipeline.sh

export APPTAINER_CACHEDIR=$TMPDIR 
export APPTAINER_TMPDIR=$TMPDIR

INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
# Step 1: Indexing
# UA indexing is slow and creates a ~50GB .uai file
apptainer run -B $BIND_PATH alignment.sif ua build --ref $REF --index $REF.uai

### run ok
apptainer run alignment.sif ua --version
apptainer run alignment.sif ua --help
apptainer run call_variants.sif ua --help
apptainer run ug_gatk_picard.sif ua --help
ug_gatk_picard.sif


# UA indexing is slow and creates a ~50GB .uai file
apptainer run alignment.sif ua --build=true --ref $REF --index $REF.uai

--index haplo_01.fa.uai

apptainer run alignment.sif ua --index $REF.uai --input $INPUT_CRAM --output $OUT_DIR/aligned_raw.bam --nthread 32

#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails


module load samtools
samtools faidx haplo_01.fa
samtools dict haplo_01.fa >  haplo_01.fa.dict

/project/xu_alfalfabreeding/system_from_home/msi/UG100/03_pipeline/
/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/

                                                                                      
#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G

## Paths

INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
INDEX="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.uai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
SAMPLE_NAME="Sample01"

 $REF.uai

ultimagenomics/make_examples
apptainer pull make_examples.sif docker://ultimagenomics/make_examples:latest

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.uai



./03_apptainer_aligment.sh: line 16: /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output//90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram.sa


apptainer run alignment.sif ua --index $REF.uai --input $INPUT_CRAM --output $OUT_DIR/aligned_raw.bam --nthread 32

apptainer run alignment.sif ua --build --ref $REF --index  $REF.uai --progress

# Step 2 : Align with UA
# When working with a single input BAM/CRAM file
samtools view -h -@ 32 $INPUT_CRAM -T $REF -F 2048 | \
apptainer run alignment.sif ua \
    --index $REF.uai \
    --align true \
    --progress \
    --tp reference \
    --stat=$OUT_DIR/output_basename.%s.json \
    --nthread max \
    --sam-input - \
    --sam-output - \
    --seed-score-ratio 0.5 --vector --soft-clipping | \
samtools view -@ 32 -o output_basename.bam -

apptainer pull docker://ultimagenomics/sorter 
ultimagenomics/sorter:1.4.15

# Step 3 : Sort UA Aligned BAM with Demux and Sorter
samtools view -h /path/to/aligned.bam -@ 32 | \
demux \
    --input=- \
    --output-dir=demux_output/ \
    --runid=output_basename \
    --nthreads 32 \
    --progress \
    --reference /path/to/reference.fasta \
    --mark-duplicates=true \
    --output-group=output_basename \
    --output-path={outputGroup}/{outputGroup} \
    --align=true

## progress on 2026/05/08

Now the files of interest are 
output_basename.cram 
output_basename.cram.crai 

and the next step is to call the variants using the scripts 05 and 06.
gVCF (Genomic Variant Call Format) and VCF (Variant Call Format) differ primarily in that gVCF records both variant and non-variant sites, providing a complete, comprehensive picture of the genome, whereas standard VCF only reports sites where variants exist compared to the reference. gVCF is intended for intermediate storage and joint genotyping, while VCF is for final.

### Output Structure

After running sorter, the output will be organized as follows:

sorter_output/
    output_basename-000/  # timestamp is appended to the run ID
        output_basename/output_basename.cram  # Main output CRAM file
        output_basename/output_basename.cram.crai  # Index file
        output_basename/output_basename.csv  # Statistics in CSV format
        output_basename/output_basename.json  # Statistics in JSON format


/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000
/output_basename/ 
run_SecondaryAnalysis.txt 
run_VariantCalling.txt

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename
output_basename_0.bedGraph.gz 
output_basename_1.bedGraph.gz 
output_basename.cram 
output_basename.cram.crai 
output_basename.json

## progress on 2026/05/11

salloc -A xu_alfalfabreeding
module load apptainer

module load samtools
samtools faidx haplo_01.fa
samtools dict haplo_01.fa >  haplo_01.fa.dict

/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts/
/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/
/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/



### does not work
apptainer run call_variants.sif ls -R /model/germline/v1.14/

apptainer run call_variants.sif ls -R /deepvariant

apptainer run -t -i call_variants.sif /bin/bash
apptainer run -it call_variants.sif bash


apptainer shell docker://ultimagenomics/call_variants:latest
apptainer exec docker://ultimagenomics/call_variants:latest ls -la /deepvariant
apptainer run call_variants.sif ls -la /deepvariant

apptainer inspect --env call_variants.sif
apptainer inspect --list-apps call_variants.sif
apptainer inspect --all call_variants.sif

${OUT_DIR}/${REF%.fa}.interval_list 
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2"


java -jar picard.jar BedToIntervalList \
      I=input.bed \
      O=list.interval_list \
      SD=reference_sequence.dict

PICARD=picard/3.0.0

module load picard/2.26.2

java -jar $PICARD_JAR SortSam

java -jar $PICARD_JAR  \
    -I ${FAI} \
    -O ${OUT_DIR}/${REF}.interval_list \
    -SD ${DIC}

picard BedToIntervalList

apptainer exec ug_gatk_picard.sif picard BedToIntervalList

java -jar $PICARDJARPATH/picard.jar SortSam
java -jar $PICARD SortSam
java -jar $PICARD_JAR SortSam
 
$PICARD or $PICARD_JAR
Error: Unable to access jarfile /picard.jar

### find where is picard
module show picard
java -jar /software/el9/apps/picard/3.0.0/picard.jar -h

### fai to bed 
awk 'BEGIN {FS="\t"}; {print $1 FS "0" FS $2}' haplo_01.fa.fai > haplo_01.fa.bed

### interval list to bed

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

java -jar $PICARD IntervalListTools \
  SCATTER_COUNT=40 \
  SUBDIVISION_MODE=BALANCING_WITHOUT_INTERVAL_SUBDIVISION_WITH_OVERFLOW \
  UNIQUE=true \
  SORT=true \
  BREAK_BANDS_AT_MULTIPLES_OF=100000 \
  INPUT=${REF%.fa}.interval_list \
  OUTPUT=out

cat interval001.interval_list | grep -v @ | awk 'BEGIN{OFS="\t"}{print $1,$2-1,$3}' > interval001.bed

Cannot read non-existent file: file:///90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.interval_list

cat: /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/interval001.interval_list: No such file or directory


/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out/temp_0001_of_40

scattered.interval_list

cat scattered.interval_list | grep -v @ | awk 'BEGIN{OFS="\t"}{print $1,$2-1,$3}' > interval0002_of_40.bed

### make_examples

#!/bin/bash
BED_INTERVAL="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out/temp_0002_of_40/interval0002_of_40.bed"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
INDEX="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.uai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"

apptainer run make_examples.sif tool --help
apptainer run ${BIND_PATH}/make_examples.sif tool --help


apptainer run make_examples.sif tool \
  --input ${CRAM} \
  --cram-index ${CRAI} \
  --bed ${BED_INTERVAL} \
  --output ${OUT_DIR}/001 \
  --reference ${REF} \
  --min-base-quality 5 \
  --min-mapq 5 \
  --cgp-min-count-snps 2 \
  --cgp-min-count-hmer-indels 2 \
  --cgp-min-count-non-hmer-indels 2 \
  --cgp-min-fraction-snps 0.12 \
  --cgp-min-fraction-hmer-indels 0.12 \
  --cgp-min-fraction-non-hmer-indels 0.06 \
  --cgp-min-mapping-quality 5 \
  --max-reads-per-region 1500 \
  --assembly-min-base-quality 0 \
  --optimal-coverages 50 \
  --median-coverage <median_coverage> \
  --add-ins-size-channel

# Step 3 : Sort UA Aligned BAM with Demux and Sorter
# ALIGNED="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename.bam"
#work ok
#samtools view -h -@ 32 $OUT_DIR/output_basename.bam | \
#apptainer run sorter.sif demux \
#    --input=- \
#    --output-dir=$OUT_DIR/ \
#    --runid=output_basename \
#    --nthreads 32 \
#    --progress \
#    --reference ${REF} \
#    --mark-duplicates=true \
#    --output-group=output_basename \
#    --output-path={outputGroup}/{outputGroup} \
#    --align=true \
#    --progress \
#    --cram-ignore-md5 \
#    --channel-id 0

# java -jar picard.jar CollectWgsMetrics \
#        I=input.bam \
#        O=collect_wgs_metrics.txt \
#        R=reference_sequence.fasta

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out/

#!/bin/bash

cd out01
for i in *
do

j=${i#*_}

cd ${i}
cat scattered.interval_list | grep -v @ | awk 'BEGIN{OFS="\t"}{print $1,$2-1,$3}' > ../../out_bed/interval_${j}.bed
cd ../

done


OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples"
for i in /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out_bed/*.bed
do

p=${i%%.bed}
done

#!/bin/bash

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"

for i in /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out_bed/*.bed
do

p=${i%%.bed}
temp=${p#interval}
result=${temp%_of*}

apptainer run make_examples.sif tool \
  --input ${CRAM} \
  --cram-index ${CRAI} \
  --bed ${i} \
  --output ${OUT_DIR}/${result} \
  --reference ${REF} \
  --min-base-quality 5 \
  --min-mapq 5 \
  --cgp-min-count-snps 2 \
  --cgp-min-count-hmer-indels 2 \
  --cgp-min-count-non-hmer-indels 2 \
  --cgp-min-fraction-snps 0.12 \
  --cgp-min-fraction-hmer-indels 0.12 \
  --cgp-min-fraction-non-hmer-indels 0.06 \
  --cgp-min-mapping-quality 5 \
  --max-reads-per-region 1500 \
  --assembly-min-base-quality 0 \
  --optimal-coverages 50 \
  --add-ins-size-channel


done

BED_INTERVAL="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out/temp_0002_of_40/interval0002_of_40.bed"

apptainer run make_examples.sif tool \
  --input ${CRAM} \
  --cram-index ${CRAI} \
  --bed ${i} \
  --output ${OUT_DIR}/${p} \
  --reference ${REF} \
  --min-base-quality 5 \
  --min-mapq 5 \
  --cgp-min-count-snps 2 \
  --cgp-min-count-hmer-indels 2 \
  --cgp-min-count-non-hmer-indels 2 \
  --cgp-min-fraction-snps 0.12 \
  --cgp-min-fraction-hmer-indels 0.12 \
  --cgp-min-fraction-non-hmer-indels 0.06 \
  --cgp-min-mapping-quality 5 \
  --max-reads-per-region 1500 \
  --assembly-min-base-quality 0 \
  --optimal-coverages 50 \
  --add-ins-size-channel


 /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples//90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out_bed/interval0001.tfrecordWARNING: SINGULARITY_TMPDIR and APPTAINER_TMPDIR have different values, using the latter

## progress on 2026/05/11

#!/bin/bash -l

#SBATCH --partition=gpu-a100
#SBATCH --qos=normal
#SBATCH --job-name=UG01
#SBATCH --account=xu_alfalfabreeding
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks=48


REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"

# Always good practice to reset environment when you start
module purge
module load apptainer/1.4.3

# apptainer run call_variants.sif --param params.ini
srun apptainer exec --nv call_variants.sif --param params.ini
srun apptainer exec
apptainer run call_variants.sif --help
apptainer exec call_variants.sif --help


my_quotas /project/xu_alfalfabreeding/system_from_home/msi/UG100
/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts
/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples/0001.tfrecord

                                                                                                                
#!/bin/bash
#SBATCH --job-name="UG01"   #name of this job
#SBATCH -N 1
#SBATCH --partition=gpu-a100
#SBATCH --qos=normal
#SBATCH --account=xu_alfalfabreeding
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH -o "%j.out"
#SBATCH -e "%j.err"
#SBATCH --gres=gpu:a100_1g.10gb:1

[cesar.medinaculma@atlas-login-2 05_UG_scripts]$ sbatch 07_call_variants.sh 
sbatch: error: Batch script contains DOS line breaks (\r\n)
sbatch: error: instead of expected UNIX line breaks (\n).
sed -i 's/\r$//'07_call_variants.sh
tr -d '\r' < 07_call_variants.sh > 08_call_variants.sh


sbatch: error: E.g.: #SBATCH --gres=gpu:<type>:<number-of-GPUS> 

#SBATCH --gres=gpu:a100_1g.10gb:4
#SBATCH --time=72:00:00
#SBATCH --partition=gpu-a100
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks=16




ERROR call_variants ../cvInferenceMain.cpp:144: Runtime error: parameter exampleFile1 is not defined
/var/spool/slurmd/job19770911/slurm_script: line 23: 331894 Aborted                 (core dumped) apptainer run --nv call_variants.sif call_variants --param params.ini

parameters file params.ini
log file ./call_variants_runID_NA_15-05-2026_16:53:23.log
build version: VERSION
Runtime error: parameter exampleFile1 is not defined


0000000 < Fri May 15 16:53:23 2026 - 0089801 > ~ <DEBUG> :parameters file: params.ini
0000001 < Fri May 15 16:53:23 2026 - 0089823 > ~ <DEBUG> :log file: ./call_variants_runID_NA_15-05-2026_16:53:23.log
0000002 < Fri May 15 16:53:23 2026 - 0089830 > ~ <DEBUG> :build version: VERSION
0000003 < Fri May 15 16:53:23 2026 - 0089845 > ~ <DEBUG> :parameter exampleFile1 is not defined
call_variants_runID_NA_15-05-2026_16:53:23.log (END)

OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples"

BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"

apptainer run ${BIND_PATH}/make_examples.sif tool --help

Producing a GVCF file
Add the arguments --gvcf and --p-error 0.005 to the make_examples step. 
--gvcf
--p-error 0.005
--gzip-output



## progress on 2026/05/18

## to change bewteen ceres to altlas
/project/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas


INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/06_atlas"


salloc -A xu_alfalfabreeding
module load apptainer
vm(INDIV, Ginv1)_

apptainer run ${BIND_PATH}/make_examples.sif tool \
  --input ${CRAM} \
  --cram-index ${CRAI} \
  --bed ${i} \
  --output ${OUT_DIR}/${result} \
  --reference ${REF} \
  --min-base-quality 5 \
  --min-mapq 1 \
--cgp-min-count-snps 2 \
  --cgp-min-count-hmer-indels 2 \
  --cgp-min-count-non-hmer-indels 2 \
  --cgp-min-fraction-snps 0.12 \
  --cgp-min-fraction-hmer-indels 0.12 \
  --cgp-min-fraction-non-hmer-indels 0.06 \
  --cgp-min-mapping-quality 5 \
  --max-reads-per-region 1500 \
  --assembly-min-base-quality 0 \
  --gvcf --p-error 0.005 \
  --optimal-coverages 50 \
  --add-ins-size-channel \
  --gzip-output


[cesar.medinaculma@atlas-login-1 05_UG_scripts]$ pwd
/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts
cp params.ini /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples/
cp 08_call_variants.sh /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples/


0040.tfrecord.gz

/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples/

### vim commnads
:%s#/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples/##g

:%s/tfrecord/.gz&/g
tfrecord
.tfrecord.gz

:%s/tfrecord/&.gz/g

ERROR call_variants ../cvInferenceMain.cpp:144: Runtime error: parameter exampleFile1 is not defined

Could not open file s3://ultimagen-workflow-resources-us-east-1/deepvariant/model/germline/v1.14/germline-ramp-8128462_shuffle_300K_ckpt_260000.onnx
Could not open file s3://ultimagen-workflow-resources-us-east-1/deepvariant/model/germline/v1.14/germline-ramp-8128462_shuffle_300K_ckpt_260000.onnx

Could not open file gs://concordanz/deepvariant/model/germline/v1.14/germline-ramp-8128462_shuffle_300K_ckpt_260000.onnx

onnx = /project/xu_alfalfabreeding/system_from_home/msi/UG100/07_model/model.ckpt-890000.dyn_1500.onnx

I found the onnx file in the [issue]<https://github.com/Ultimagen/healthomics-workflows/issues/27>. 

The command is: 
mkdir model
aws s3 cp s3://ultimagen-workflow-resources-us-east-1/deepvariant/model/germline/v1.3/model.ckpt-890000.dyn_1500.onnx model/ --no-sign-request

aws cli was dowloaded in my mac using brew. brew install awscli
The model was uploaded to box.



[05/21/2026-07:02:26] [W] [TRT] onnx2trt_utils.cpp:374: Your ONNX model has been generated with INT64 weights, while TensorRT does not natively support INT64. Attempting to cast down to INT32.
[05/21/2026-07:05:05] [W] [TRT] Engine generation failed with backend strategy 3.
Error message: [optimizer.cpp::computeCosts::3869] Error Code 10: Internal Error (Could not find any implementation for node {ForeignNode[InceptionV3/InceptionV3/Conv2d_1a_3x3/BatchNorm/FusedBatchNormV3__6...InceptionV3/InceptionV3/Conv2d_2b_3x3/Relu]}.).
Skipping this backend strategy.


mkdir out01 && \
java -jar $PICARD IntervalListTools \
  SCATTER_COUNT=40 \
  SUBDIVISION_MODE=INTERVAL_SUBDIVISION \
  UNIQUE=true \
  SORT=true \
  BREAK_BANDS_AT_MULTIPLES_OF=0 \
  INPUT=haplo_01.interval_list \
  OUTPUT=out01


./05.2_interval_bed.sh: line 27: cd: *: No such file or directory
./05.2_interval_bed.sh: line 28: ../../out_bed02/interval*.bed: No such file or directory
cat: scattered.interval_list: No such file or directory

--progress


ug_postproc \
  --infile call_variants.1.gz,call_variants.2.gz,... \
  --ref Homo_sapiens_assembly38.fasta \
  --outfile output_prefix.vcf.gz \
  --consider_strand_bias \
  --flow_order TGCA \
  --annotate \
  --bed_annotation_files exome.twist.bed,ug_hcr.bed,... \
  --qual_filter 1 \
  --filter \
  --filters_file filters.txt \
  --dbsnp Homo_sapiens_assembly38.dbsnp138.vcf

  --gvcf_outfile output_prefix.g.vcf.gz gvcf.tfrecord.gz files
  --nonvariant_site_tfrecord_path

  gvcf.tfrecord.gz 

  --nonvariant_site_tfrecord_path

  --gq-resolution
  --gq-thresholds