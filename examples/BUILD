cc_library(
    name = "main",
    srcs = ["main.c"],
)

cc_binary(
    name = "test_default",
    deps = [":main"],
)

cc_binary(
    name = "test_csrand",
    deps = [":main", "@libcsrand//:csrand"],
)
