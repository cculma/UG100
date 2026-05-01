# sudo systemctl enable --now docker
# docker ps

BIN_VERSION="1.10.0" # Use the latest version
INPUT_DIR="/path/to/your/data" # all to the indexed genome
OUTPUT_DIR="/path/to/output"

docker run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=ULTIMA_WGS \
  --ref=/input/reference.fasta \
  --reads=/input/aligned_final.bam \
  --output_vcf=/output/sample.vcf.gz \
  --output_gvcf=/output/sample.g.vcf.gz \
  --num_shards=$(nproc) \
  --make_gvcf=true

  apptainer run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=ULTIMA_WGS \
  --ref=/input/reference.fasta \
  --reads=/input/aligned_final.bam \
  --output_vcf=/output/sample.vcf.gz \
  --output_gvcf=/output/sample.g.vcf.gz \
  --num_shards=80 \
  --make_gvcf=true