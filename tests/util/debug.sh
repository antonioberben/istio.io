#!/usr/bin/env bash

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Creating test debug file: ${TEST_DEBUG_FILE}"

# Dynamically select an unused file descriptor (requires bash 4.1+)
exec {FD}> "${TEST_DEBUG_FILE}"
export BASH_XTRACEFD="${FD}"
export PS4='+${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -x
