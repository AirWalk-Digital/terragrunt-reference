import os

"""Configuration settings for running the Python auth samples locally.

In a production deployment, this information should be saved in a database or
other secure storage mechanism.
"""
AZURE_TENANT_ID = os.environ['AZURE_TENANT_ID']
CLIENT_ID = os.environ['CLIENT_ID']
CLIENT_SECRET = os.environ['CLIENT_SECRET']
REDIRECT_URI = os.environ['REDIRECT_URI']
APP_URI = os.environ['APP_URI']
FLASK_SECRET = os.environ['FLASK_SECRET']
ENVIRONMENT = os.environ['ENVIRONMENT']
CLOUDFRONT_KEY_ID = os.environ['CLOUDFRONT_KEY_ID']


# AUTHORITY_URL ending determines type of account that can be authenticated:
# /organizations = organizational accounts only
# /consumers = MSAs only (Microsoft Accounts - Live.com, Hotmail.com, etc.)
# /common = allow both types of accounts
# AUTHORITY_URL = 'https://login.microsoftonline.com/common'

AUTHORITY_URL = 'https://login.microsoftonline.com/' + AZURE_TENANT_ID


AUTH_ENDPOINT = '/oauth2/v2.0/authorize'
TOKEN_ENDPOINT = '/oauth2/v2.0/token'

RESOURCE = AUTHORITY_URL

API_VERSION = 'v1.0'
SCOPES = ['User.Read'] # Add other scopes/permissions as needed.
GRAPH_API = 'https://graph.microsoft.com/v1.0/'

# This code can be removed after configuring CLIENT_ID and CLIENT_SECRET above.
if 'ENTER_YOUR' in CLIENT_ID or 'ENTER_YOUR' in CLIENT_SECRET:
    print('ERROR: config.py does not contain valid CLIENT_ID and CLIENT_SECRET')
    import sys
    sys.exit(1)
