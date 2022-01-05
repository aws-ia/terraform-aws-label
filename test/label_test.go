package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

const (
	namespace_value = "mynamespace"
	account_value   = "myaccount"
	env_value       = "myenv"
	name_value      = "myname"
	delimiter       = "-"
	module_dir      = "../"
)

func TestAllVarsInId(t *testing.T) {
	all_vars_expected := []string{namespace_value, account_value, env_value, name_value}
	all_vars_expected_id := strings.Join(all_vars_expected, delimiter)

	terraformOptions := &terraform.Options{
		TerraformDir: module_dir,
		Vars: map[string]interface{}{
			"namespace": namespace_value,
			"account":   account_value,
			"env":       env_value,
			"name":      name_value,
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Validate `id` only made of optionally passed vars, env-name
	output_id := terraform.Output(t, terraformOptions, "id")
	assert.Equal(t, all_vars_expected_id, output_id)

	// Validate `tags` only made of optionally passed vars, env-name
	output_tags := terraform.OutputListOfObjects(t, terraformOptions, "tags")
	assert.Equal(t, len(all_vars_expected), len(output_tags))

	// Validate `tags_aws` made of all passed, namespace-account-env-name
	output_tags_aws := terraform.OutputMap(t, terraformOptions, "tags_aws")
	assert.Equal(t, len(all_vars_expected), len(output_tags_aws))
}

func TestOptionalVarsInId(t *testing.T) {
	opt_vars_expected := []string{env_value, name_value}
	opt_vars_expected_id := strings.Join(opt_vars_expected, delimiter)

	terraformOptions := &terraform.Options{
		TerraformDir: module_dir,
		Vars: map[string]interface{}{
			"env":  env_value,
			"name": name_value,
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Validate `id` only made of optionally passed vars, env-name
	output_id := terraform.Output(t, terraformOptions, "id")
	assert.Equal(t, opt_vars_expected_id, output_id)

	// Validate `tags` only made of optionally passed vars, env-name
	output_tags := terraform.OutputListOfObjects(t, terraformOptions, "tags")
	assert.Equal(t, len(opt_vars_expected), len(output_tags))

	// Validate `tags_aws` only made of optionally passed vars, env-name
	output_tags_aws := terraform.OutputMap(t, terraformOptions, "tags_aws")
	assert.Equal(t, len(opt_vars_expected), len(output_tags_aws))
}

func TestOptionalVarsInIdReordered(t *testing.T) {
	reordered_opt_vars_expected := []string{name_value, env_value}
	reordered_opt_vars_expected_id := strings.Join(reordered_opt_vars_expected, delimiter)
	reordered := []string{"name", "env"}

	terraformOptions := &terraform.Options{
		TerraformDir: module_dir,
		Vars: map[string]interface{}{
			"env":      env_value,
			"name":     name_value,
			"id_order": reordered,
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Validate `id` only made of optionally passed vars, env-name
	output_id_reordered := terraform.Output(t, terraformOptions, "id")
	assert.Equal(t, reordered_opt_vars_expected_id, output_id_reordered)
}
