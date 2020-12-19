from diagrams import Cluster, Diagram
from diagrams.aws.security import IdentityAndAccessManagementIamRole
from diagrams.aws.management import Cloudwatch, Cloudtrail
from diagrams.aws.database import Neptune
#from diagrams.aws.ml import SagemakerNotebook
from diagrams.aws.compute import Lambda

with Diagram("Auto start stop", show=False):

    with Cluster("Cloudwatch Events"):
        event_rules = [
            Cloudwatch("Event Rule On"),
            Cloudwatch("Event Rule Off")
        ]

    with Cluster("Lambda On/Off"):
        fn_on_off = Lambda("Auto On/Off")
        fn_on_off - [IdentityAndAccessManagementIamRole("Lambda Role")]

    with Cluster("Neptune Clusters"):
        neptune_db = [Neptune("db1"), Neptune("db2"), Neptune("db3")]

    logs = Cloudtrail("Logs")

    event_rules >> fn_on_off
    fn_on_off >> neptune_db
    fn_on_off >> logs
