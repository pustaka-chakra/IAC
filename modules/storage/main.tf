resource "aws_s3_bucket" "uploads" { 
    bucket = "${var.project_name}-uploads" 
    tags = {
        Name = "${var.project_name}-uploads"
    }
}

resource "aws_s3_bucket_public_access_block" "uploads" { 
    bucket = aws_s3_bucket.uploads.id

    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true 
}

resource "aws_s3_bucket_cors_configuration" "uploads" {
    bucket = aws_s3_bucket.uploads.id 

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["PUT", "POST"]
        allowed_origins = ["*"]
        max_age_seconds = 3000
    }
}