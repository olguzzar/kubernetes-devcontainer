# Copyright 2023 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env bash

set -eux

# Copies over welcome message
cp .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt

# Setup environment variables for contributing to the Kubernetes project using the GitHub workflow
# as documented at https://www.kubernetes.dev/docs/guide/github-workflow/
export working_dir="$(go env GOPATH)/src/k8s.io"
export user="$GITHUB_USER"
git remote add upstream https://github.com/kubernetes/kubernetes.git
# Never push to upstream master
git remote set-url --push upstream no_push
