terraform {
  backend "s3" {
    bucket  = "20170911-tfstate"
    key     = "kafka"
    region  = "eu-west-1"
    encrypt = true
  }
}
