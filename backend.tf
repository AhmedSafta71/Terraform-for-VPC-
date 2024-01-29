terraform {
    backend  "s3"{
        bucket = "/"
        key = "terrform/backend"
        region = "us-east-1"
    }
}