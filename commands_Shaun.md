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



stdout.20618664.ceres25-compute-5



ERROR! Unable to open the file: /project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01/haplo_01.fa.bwt.2bit.64



GENOME=/project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01/haplo_01.fa



GENOME=/project/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa





421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram.aligned_raw.bam



421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram



/project/xu_alfalfabreeding/system_from_home/msi/Silphium/scripts01

$TMPDIR



2026/04/30



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



Sentieon® Genomics is a commercial sowtware. The other option os ti use Deep Variant.



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



&#x20;--model_type: <WGS|WES|PACBIO|ONT_R104|HYBRID_PACBIO_ILLUMINA|MASSEQ|RNASEQ>



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

2026/05/01

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
# Paths

INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
INDEX="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.uai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
SAMPLE_NAME="Sample01"

 $REF.uai


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