package config

// RunArgs are arguments passed to the run command
type RunArgs struct {
	AWSRegion string
	JSON      bool
	IAAS      string
	Env       bool
}
