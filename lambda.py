import json
import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("Cloud-Resume-Visitor-Counter")


def lambda_handler(event, context):
    response = table.get_item(Key={"Record": "Counter"})

    count = response["Item"]["TotalCount"]
    print("Get Response = ", response)
    print("Count = ", count)

    # increment the number of views
    newCount = str(int(count) + 1)
    response = table.update_item(
        Key={"Record": "Counter"},
        UpdateExpression="set TotalCount = :count",
        ExpressionAttributeValues={":count": newCount},
        ReturnValues="UPDATED_NEW",
    )

    return {
        "body": newCount,
        "headers": {
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Origin": "https://kristenwyc.com",
            "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
        },
    }
