terraform { 
    backend "s3" {
        bucket = "pustaka-chakra-tf-state"
        key    = "global/terraform.tfstate" 
        region = "ap-south-2"
    }
}