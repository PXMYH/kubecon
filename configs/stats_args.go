package config

// StatsArgs are arguments passed to the stats command
type StatsArgs struct {
	AWSRegion string
	JSON      bool
	IAAS      string
	Env       bool
}
