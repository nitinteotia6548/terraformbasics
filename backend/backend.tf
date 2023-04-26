terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "remote-backend-nitin"
        region = "ap-southeast-1"
        access_key = "**********"
        secret_key = "**********"
    }
}