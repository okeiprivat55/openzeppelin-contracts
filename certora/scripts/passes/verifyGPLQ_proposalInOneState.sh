#!/usr/bin/env bash

set -euxo pipefail

certoraRun \
    certora/harnesses/ERC20VotesHarness.sol certora/harnesses/GovernorFullHarness.sol certora/munged/governance/TimelockController.sol \
    --verify GovernorFullHarness:certora/specs/GovernorPreventLateQuorum.spec \
    --link GovernorFullHarness:token=ERC20VotesHarness \
    --optimistic_loop \
    --rule proposalInOneState \
    --settings -t=1000 \
    --loop_iter 1 \
    $@