const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "awscrud": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://hm6omag5jzad7fp6lvok5ogwsi.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-b25jx47yknh7rh6dahth4yb7ge"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://hm6omag5jzad7fp6lvok5ogwsi.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-b25jx47yknh7rh6dahth4yb7ge",
                        "ClientDatabasePrefix": "awscrud_API_KEY"
                    },
                    "awscrud_AWS_IAM": {
                        "ApiUrl": "https://hm6omag5jzad7fp6lvok5ogwsi.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "awscrud_AWS_IAM"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:ef82439f-9861-4a2f-aaff-494016e5bf4d",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_N2J16pgIM",
                        "AppClientId": "7i44b1ra03ab3uvf7u3c8br0s8",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "firstcrud68740884-68740884-staging.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "7i44b1ra03ab3uvf7u3c8br0s8",
                            "SignInRedirectURI": "awscrud://",
                            "SignOutRedirectURI": "awscrud://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';