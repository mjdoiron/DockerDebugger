import json
import scipy as sci
import numpy as nm
import jsonschema
import pandas as pd


def lambda_handler(event, context):
    a = sci
    b = nm
    c = jsonschema
    d = pd

    message = event.get("body")
    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }
