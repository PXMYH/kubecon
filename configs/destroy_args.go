package config

// DestroyArgs are arguments passed to the destroy command
type DestroyArgs struct {
	AWSRegion string
	JSON      bool
	IAAS      string
	Env       bool
}
