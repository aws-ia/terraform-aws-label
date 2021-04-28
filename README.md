# terraform-aws-label
A Terraform module implemented to generate uniform and consistent naming and tags for terraform resources.
# Module Input Variables
```region``` - AWS Region used to host the resources.

```namespace``` - namespace, which could be your organisation/department name, e.g. amazon

```env``` - environment name e.g. 'sit', 'uat', 'prod' etc

```account``` - which could be AWS Account Name or Number

```name``` - stack name

```delimiter``` - which could be used between name, namespace and env to form the resource name

```attributes``` - which could be used for additional attributes

```tags``` - which could be used for additional tags

# Usage
module "label" {

    source  = "aws-quickstart/label/aws"

    version = "0.0.1"

    region = "us-east-1"

    namespace = "my org"

    env = "sit"

    account = "aws-account-name"

    name = "deployment name"

    delimiter = "-"

    tags      = tomap({ propogate_at_launch = "true", "terraform" = "true" })

}


# Outputs
```tags``` - list of tags

```id``` - id of the tag delimited with "-"

```name``` - stack name

```namespace``` - namespace

```account``` - AWS Account

```env``` - environment name

```attributes``` - list of additional attributes

