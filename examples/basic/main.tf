provider "awscc" {
  region = var.region
}

module "labels" {
  source = "../.."

  name      = "measurements"
  namespace = "link"

  env     = "sandbox"
  account = "sandbox001"

  region = var.region
  tags = [
    {
      "key" : "team",
      "value" : "link"
    },
    {
      "key" : "department",
      "value" : "connected-technologies"
    }
  ]
}

