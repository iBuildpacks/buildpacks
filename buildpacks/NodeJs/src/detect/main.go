package main

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/iBuildpacks/libbuildpack/detect"
)

func main() {
	var err error
	var detector detect.Detect

	if detector, err = detect.DefaultDetect(); err != nil {
		fmt.Printf("Initialize detect with error: %v", err)
		os.Exit(detector.Fail())
	}
	fmt.Println(detector.Buildpack.Root)
	fmt.Println(filepath.Glob(detector.Buildpack.Root))
	fmt.Println(detector.Platform.Root)
	fmt.Printf("%+v", detector)
	os.Exit(detector.Fail())
}
