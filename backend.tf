terraform {
 backend "s3" {
	bucket = "kubernetesbrianstate.com"
	key  = "terrastate"
	region = "us-west-2"
  }
}
