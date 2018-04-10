package commands

import (
	"errors"
	"os"

	"gopkg.in/urfave/cli.v1"
)

var runArgs config.RunArgs

var runFlags = []cli.Flag {
	fmt.Printf("Running\n")
}

var run = cli.Command {
	Name:      "run",
	Aliases:   []string{"d"},
	Usage:     "Deploys or updates a Concourse",
	ArgsUsage: "<name>",
	Flags:     runFlags,
}
