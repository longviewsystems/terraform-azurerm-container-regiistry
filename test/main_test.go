package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAzureACR(t *testing.T) {
	t.Parallel()

	// Define Terraform options
	terraformOptions := &terraform.Options{
		TerraformDir: "./fixtures",
	}

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get output values
	//acrID := terraform.Output(t, terraformOptions, "acr_id")
	acrLoginServer := terraform.Output(t, terraformOptions, "acr_login_server")

	// Validate the ACR ID and login server are not empty
	//assert.NotEmpty(t, acrID, "ACR ID should not be empty")
	assert.NotEmpty(t, acrLoginServer, "ACR login server should not be empty")
}
