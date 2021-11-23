package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func validate(t *testing.T, terraformOptions *terraform.Options)  {
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}

func TestBasic(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/basic",
	}

	validate(t, terraformOptions)
}

func TestFormattedTags(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/formatted_tags",
	}

	validate(t, terraformOptions)
}

