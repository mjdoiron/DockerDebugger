import json
# import scipy as sci
# import numpy as nm
# import jsonschema
# import pandas as pd
# import debugpy


def lambda_handler(event, context):
    # a = sci
    # b = nm
    # c = jsonschema
    # d = pd

    # debugpy.listen(('0.0.0.0', 5678))
    # debugpy.wait_for_client()

    message = event.get("body", "Default Response: No body sent")

    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }
