package main

import (
	"errors"
	"fmt"
	"os"
	"strings"

	"github.com/fatih/color"
	"gopkg.in/urfave/cli.v1"
)

var KubeConVersion = "v0.0.1"
var blue = color.New(color.FgCyan, color.Bold).SprintfFunc()

func main() {
	app := cli.NewApp()
	app.Name = "KubeCon"
	app.Usage = "A CLI tool to deploy Concourse CI"
	app.Version = KubeConVersion
	app.Commands = commands.Commands
	app.Flags = commands.GlobalFlags
	cli.AppHelpTemplate = fmt.Sprintf(`%s

See 'kubecon help <command>' to read about a specific command.

Built by %s %s

`, cli.AppHelpTemplate, blue("Coeus77"), blue("https://mtothrys.wordpress.com"))

	if err := app.Run(os.Args); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}