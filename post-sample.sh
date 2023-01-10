#!/usr/bin/env bash
set -euo pipefail
# Payload needs to be formatted differently as this Lambda expects API gateway to proxy requests.
# API gateway sends specially crafted event.
# See the following article for more details: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format
payload=${1:-sample.json}
# Notice the path following the base url.  We use this for local testing as we must use "RIE" to emulate the Lambda runtime interface.
# See the following article for more details: https://docs.aws.amazon.com/lambda/latest/dg/images-test.html
base_url="http://localhost:8080"
echo ">>>> Testing >>>>"
cat "${payload}" | jq
echo "<<<< Received <<<"
curl -s -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' \
    -d @${payload} \
    "${base_url}/2015-03-31/functions/function/invocations"  | jq '.body | fromjson' 