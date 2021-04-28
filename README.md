# Terraform AWS Label module
The Terraform Amazon Web Services (AWS) Label module generates consistent label names and tags for Terraform resources.

## Module input variables

* ```region``` - AWS Region used to host Terraform resources.

* ```namespace``` - Namespace, generally your organization or department name (for example, ```AWS```).

* ```env``` - Environment name (for example, ```sit```, ```uat```, or ```prod```).

* ```account``` - AWS account name or number.

* ```name``` - Stack name.

* ```delimiter``` - Character such as a slash (/) used between ```name```, ```namespace```, and ```env``` to form the resource name.

* ```attributes``` - Additional attributes.

* ```tags``` - Additional tags.

## Usage

module "label" {

    source = "git@github.com:aws-quickstart/terraform-aws-label.git"

    region = "us-east-1"

    namespace = "it-digial"

    env = "sit"

    account = "aws-account-name"

    name = "stackname"

    delimiter = "-"

    tags = "${map("key","name","value","${var.name}","propogate_at_launch","true","terraform","true")}"

}


## Outputs

* ```tags``` - List of tags.

* ```id``` - ID of a tag delimited with a dash (-).

* ```name``` - Stack name.

* ```namespace``` - Namespace.

* ```account``` - AWS account.

* ```env``` - Environment name.

* ```attributes``` - List of additional attributes.
