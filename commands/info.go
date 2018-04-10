package commands

import (
	"errors"
	"os"

	"gopkg.in/urfave/cli.v1"
)

var infoArgs config.InfoArgs

var infoFlags = []cli.Flag {
	fmt.Printf("infoning\n")
}

var info = cli.Command {
	Name:      "info",
	Aliases:   []string{"d"},
	Usage:     "Deploys or updates a Concourse",
	ArgsUsage: "<name>",
	Flags:     infoFlags,
}
