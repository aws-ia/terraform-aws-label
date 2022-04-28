package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestFormattedTags(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/formatted_tags",
	}

	Validate(t, terraformOptions)
}
