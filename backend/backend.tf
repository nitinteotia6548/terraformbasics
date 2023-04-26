terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "remote-backend-nitin"
        region = "ap-southeast-1"
        access_key = "AKIASNW5FYFXTIKMRNAQ"
        secret_key = "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"
    }
}