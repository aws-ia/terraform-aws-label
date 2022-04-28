provider "awscc" {
  region = var.region
}

module "labels" {
  source = "../.."

  name      = var.name
  namespace = var.namespace

  env     = var.env
  account = var.account

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

