package config

import (
	"fmt"
	"strings"
)

// Config represents a concourse-up configuration file
type Config struct {
	Vault_URL                string `json:"vault_url"`
	Vault_Username           string `json:"vault_username"`
	Vault_Password           string `json:"vault_password"`
	Vault_CACert             string `json:"vault_cacert"`
}