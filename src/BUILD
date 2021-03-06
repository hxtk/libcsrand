cc_library(
    name = "csrand",
    srcs = ["rand.S"],
    visibility = ["//:__pkg__"],
)

cc_library(
    name = "csrand-sysmaxrand",
    srcs = ["rand.c"],
    visibility = ["//:__pkg__"],
)

cc_library(
    name = "main",
    srcs = ["main.c"],
)

cc_binary(
    name = "test_default_rand",
    deps = [":main"],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "test_cs_rand",
    deps = [":main", ":csrand"],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "test_cs_rand_c",
    deps = [":main", ":csrand-sysmaxrand"],
    visibility = ["//visibility:public"],
)
