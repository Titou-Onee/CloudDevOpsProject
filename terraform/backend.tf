terraform {
  backend "s3" {
    bucket = "s3_backend" #créer un bucket
    key    = "path/to/my/key" #mettre en place un répertoire key
    region = "us-east-1" #mettre en place une variable
    use_lockfile = true
  }
}
