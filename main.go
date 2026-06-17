// echo-sidecar is a command-line tool that uses sidecar to implement and call a gRPC service.
package main

import (
	"os"

	"github.com/agentio/echo-sidecar/commands"
)

func main() {
	if err := commands.Cmd().Execute(); err != nil {
		os.Exit(1)
	}
}
