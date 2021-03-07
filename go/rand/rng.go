package rand

import (
	stdrand "math/rand"
	_ "unsafe"
)

func getInt63() int64

func getUint64() uint64

type source struct{}

func (s *source) Int63() int64 {
	return getInt63()
}

func (s *source) Uint64() uint64 {
	return getUint64()
}

func (s *source) Seed(seed int64) {
	// do nothing
}

func NewSource() *source {
	return &source{}
}


//go:linkname globalRand math/rand.globalRand
var globalRand *stdrand.Rand

func init() {
	globalRand = stdrand.New(NewSource())
}
