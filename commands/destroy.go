package commands

import (
	"errors"
	"os"

	"gopkg.in/urfave/cli.v1"
)

var destroyArgs config.DestroyArgs

var destroyFlags = []cli.Flag {
	fmt.Printf("destroying\n")
}

var destroy = cli.Command {
	Name:      "destroy",
	Aliases:   []string{"d"},
	Usage:     "Demolish a Concourse",
	ArgsUsage: "<name>",
	Flags:     destroyFlags,
}
