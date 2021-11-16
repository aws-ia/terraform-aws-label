
# Terraform AWS Label Module
The Terraform Amazon Web Services (AWS) Label module generates consistent label names and tags for Terraform resources.

---

## Inputs

* ```region```
    * description: AWS Region used to host Terraform resources.
    * type: ``` string ```
    * default: ``` us-west-1 ```
    <br />

* ```namespace```
    * description: Namespace, generally your organization or department name (for example, ```AWS```)
    * type: ``` string ```
    * default: ``` testenv ```
    <br />

* ```env```
    * description: Environment name (for example, ```sit```, ```uat```, or ```prod```)
    * type: ``` string ```
    * default: ``` testns ```
    <br />

* ```account```
    * description: AWS account name or number.
    * type: ``` string ```
    * default: ``` testacc ```
    <br />

* ```name```
    * description: Stack name
    * type: ``` string ```
    * default: ``` testname ```
    <br />


* ```delimiter```
    * description: Character such as a slash (/) used between ```name```, ```namespace```, and ```env``` to form the resource name.
    * type: ``` string ```
    * default: ``` - ```
    <br />

* ```attributes```
    * description: Additional attributes.
    * type: ``` list ```
    * default: ``` [] ```
    <br />

* ```tags```
    * description: Additional tags.
    * type: ``` list(object({
      key   = string
      value = string
      })) ```
    * default: ``` [] ```
    <br />

---

## Usage

    module "label" {
      source    = "aws-ia/label/aws"
      version   = "0.0.2"
      region    = "us-east-1"
      namespace = "my org"
      env       = "sit"
      account   = "aws-account-name"
      name      = "deployment name"
      delimiter = "-"
      tags      = tomap({ propogate_at_launch = "true", "terraform" = "true" })
    }

For more information please see the `examples` folder.

---

## Outputs

* ```tags``` - List of tags.

* ```id``` - ID of a tag delimited with a dash (-).

* ```name``` - Stack name.

* ```namespace``` - Namespace.

* ```account``` - AWS account.

* ```env``` - Environment name.

* ```attributes``` - List of additional attributes.

---