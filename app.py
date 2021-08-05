import sys

import pandas

def lambda_handler(event, context):
    print(f'python version {sys.version}')
    print(f'pandas version {pandas.__version__}')
    return {'message': 'hello world!'}