# Secure Random

Drop-in replacement for stdlib.h `rand()` (see `man 3 rand`).

## Purpose

For security reasons, you might wish that PRNGs were cryptographically secure
by default, because the default `rand()` function is neither fast nor random
enough for many high-speed simulation applications nor is it unpredictable
enough for security-sensitive usage. In general, if a program is using the
default PRNG where it should be using something cryptographically secure,
the risk is much higher than if the inverse is true.

This is a static library which can be linked into any C program using `rand()`
at compile time and will provide NIST-compliant cryptographically secure random
numbers without any changes to the code base.

## Usage

See the `Makefile` and `src/BUILD.bazel` for examples using GNU Make and
Google's Bazel tool, respectively.

To link against the library from this repository with `gcc`:

```
# Run in this repo's directory:
$ make lib/libcsrand.a

# Run in your package build directory:
$ gcc foo.o -L./path/to/this/repo/lib -lcsrand -o bar
```

To link against the library from this repository after installing it to your
system:

```
gcc foo.o -lcsrand -o bar
```

For Bazel simply add this library to your dependencies:

```python
cc_binary(
    name = "foo",
    deps = [
       "@secure-rand//:csrand,
       ...
    ],
    ...
)
```

## Caveats

This random number generator cannot be seeded, since the point is to have
results that are never predictable. If it is linked into a program that at any
point calls `void srand(unsigned int)`, that `srand` call will effectively
become a no-op. Nothing will break from an API standpoint, but this could
introduce difficult-to-debug errors if the calling context relies on
reproducibile or predictable RNG.

This library also assumes that it is being run on an Intel or AMD system with
the `rdrand` CPU instruction. It assumes that an `int` is a 32-bit signed
twos-complement integer and `MAX_RAND` is precisely `0x7fffffff`
(`2147483647` in decimal), the maximum 32-bit twos-complement integer.

On systems where the final assumption does not hold, this may subtly change
the API of `rand()`. An alternative implementation is written in C which
references the value of `MAX_RAND` found in `stdlib.h`, and can be built as
`librandc.a` using the included Makefile.
