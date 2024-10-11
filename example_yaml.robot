*** Settings ***
Variables   ../TEST/data.yaml


*** Test Cases ***
Example yaml
    log to console      ${username.perf.data_test}
