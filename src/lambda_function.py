import boto3
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

client = boto3.client('neptune')


def lambda_handler(event, context):

    candidates = client.describe_db_clusters()

    for candidate in candidates['DBClusters']:
        candidateName = candidate['DBClusterIdentifier']
        logger.info('instance {0} is in Service'.format(candidateName))
        instanceArn = candidate['DBClusterArn']
        instanceTags = client.list_tags_for_resource(ResourceName=instanceArn)
        for tag in instanceTags['TagList']:
            if (tag['Key'] == 'OfficeHours' and tag['Value'] == 'Yes'):
                logger.info(
                    'instance {0} is in office hours'.format(candidateName))
                if (event['event'] == "On" and candidate['Status'] == 'stopped'):
                    response = client.start_db_cluster(
                        DBClusterIdentifier=candidateName)
                    logger.info(
                        'instance {0} was started'.format(candidateName))
                elif (event['event'] == "Off" and candidate['Status'] == 'available'):
                    response = client.stop_db_cluster(
                        DBClusterIdentifier=candidateName)
                    logger.info(
                        'instance {0} was stopped'.format(candidateName))
            else:
                logger.info('Not in office hours'.format(candidateName))

    return "Done"
