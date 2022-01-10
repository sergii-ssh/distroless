#!/bin/bash

bazel test --test_output=errors --test_timeout=900 $(bazel query 'attr("tags", "amd64", "//istio/...")')
