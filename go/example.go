package main

import (
	"fmt"
	"math/rand"

	_ "github.com/hxtk/libcsrand/go/rand"
)

func main() {
	fmt.Println(rand.Intn(100))
}
