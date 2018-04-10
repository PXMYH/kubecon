package commands

import (
	"errors"
	"os"

	"gopkg.in/urfave/cli.v1"
)

var statsArgs config.StatsArgs

var statsFlags = []cli.Flag {
	fmt.Printf("statsning\n")
}

var stats = cli.Command {
	Name:      "stats",
	Aliases:   []string{"d"},
	Usage:     "Deploys or updates a Concourse",
	ArgsUsage: "<name>",
	Flags:     statsFlags,
}
