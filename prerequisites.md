# Run to create S3 for state file 
```bash
aws s3api create-bucket \
  --bucket pustaka-chakra-tf-state \
  --region ap-south-2 \
  --create-bucket-configuration LocationConstraint=ap-south-2
```
### Output: 
```bash 
{
    "Location": "http://pustaka-chakra-tf-state.s3.amazonaws.com/",
    "BucketArn": "arn:aws:s3:::pustaka-chakra-tf-state"
}
```

What it does: Creates an S3 bucket named pustaka-chakra-tf-state in Hyderabad.

Why s3api and not s3? AWS CLI has two S3 interfaces:

aws s3 — simple, high-level commands (copy files, sync folders)
aws s3api — full API access, needed when you want to configure bucket settings
Why LocationConstraint? S3 is a global service but buckets live in specific regions. AWS requires you to explicitly state the region when creating a bucket outside us-east-1 (their default). This quirk trips everyone up the first time.

Why this bucket specifically? This is where Terraform saves its state file — the record of every AWS resource it has ever created. Without it, Terraform has no memory.

---
# Enable versioning on the state file 

```
aws s3api put-bucket-versioning \
  --bucket pustaka-chakra-tf-state \
  --versioning-configuration Status=Enabled
```
### Creates no output on command running 

What it does: Turns on versioning for the state bucket.

Why? Every time you run terraform apply, Terraform overwrites the state file with a new version. Versioning means S3 keeps every previous copy. If an apply corrupts your state (it happens — power cut, crash mid-apply), you can restore the last known good state file from S3's version history.

Think of it as git history but for your infrastructure state file.

--- 
# NOT DOING THIS - Primarily needed for State Locking - Not needed for a single user State Locking 
```
aws dynamodb create-table \
  --table-name pustaka-chakra-tf-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region ap-south-2
```

What it does: Creates a DynamoDB table (a key-value store) named pustaka-chakra-tf-locks.

Why LockID as the key? Terraform writes a single row to this table when it starts running, using LockID as the identifier. When it finishes, it deletes that row. If Terraform sees a row already exists when it tries to start, it refuses to run and says "state is locked by another process."

Why PAY_PER_REQUEST? Two billing modes exist:

PROVISIONED — you pre-pay for a fixed capacity, whether you use it or not
PAY_PER_REQUEST — you pay only for actual requests made
This table will receive maybe a few requests per week. Pay-per-request costs fractions of a cent. Provisioned capacity would cost ~$0.65/month for something you barely use.

Why DynamoDB and not something simpler? Terraform's S3 backend is hardcoded to use DynamoDB for locking. No choice — it's the only supported lock mechanism for S3 state.

