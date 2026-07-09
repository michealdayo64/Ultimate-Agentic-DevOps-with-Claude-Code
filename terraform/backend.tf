# ---------------------------------------------------------------------------
# Remote state backend (S3)
# ---------------------------------------------------------------------------
# The backend is intentionally COMMENTED OUT for the first run. Terraform needs
# a state bucket to exist before it can store state there, so bootstrap locally
# first:
#
#   1. Leave this block commented and run:
#        terraform init
#        terraform apply        # creates the S3 site bucket + CloudFront, etc.
#
#   2. Create a dedicated bucket for Terraform state (once, out of band), e.g.:
#        aws s3api create-bucket \
#          --bucket portfolio-site-tfstate \
#          --region ap-south-1 \
#          --create-bucket-configuration LocationConstraint=ap-south-1
#        aws s3api put-bucket-versioning \
#          --bucket portfolio-site-tfstate \
#          --versioning-configuration Status=Enabled
#
#   3. Uncomment the block below, set the bucket/key/region, then migrate:
#        terraform init -migrate-state
#
# terraform {
#   backend "s3" {
#     bucket       = "portfolio-site-tfstate"
#     key          = "portfolio-site/terraform.tfstate"
#     region       = "ap-south-1"
#     encrypt      = true
#     use_lockfile = true
#   }
# }
