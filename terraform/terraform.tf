terraform {
  backend "s3" {
  bucket = "terraform-s3-backend-fendi-eks-observability"
    key    = "backend-locking"
    region = "us-west-2"
    use_lockfile = true
  }
}