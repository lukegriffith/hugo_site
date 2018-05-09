---
title: "VPC Flow Log Woes"
date: 2018-05-09T23:31:57+01:00
draft: false
---

I believe I've identified a bug where the VPCFlowLogs verbs in ec2, create, describe and delete do not work when a source IP condition is applied against the policy.

I've replicated the problem in [this terraform module](https://github.com/lukemgriffith/aws-dev/tree/master/VPCFlowLogsBug). At line 79 in main.tf is the role policy attachment that is currently attaching flow_test_policy. This is the IAM policy with the source IP condition in, if used all EC2 actions can be completed except any of the VPC flow actions and can be replicated via the console by navigating to VPC > Your VPCs > Select VPC main > Flow Logs

An error will appear saying you're not authorized to perform this operation. AWS knows who I am, but doesn't believe I am authorized. yet I can list VPC's as the policy states, under the source IP condition. 


_The current configuration_
```hcl
resource "aws_iam_role_policy_attachment" "flow_test_attach" {
    role       = "${aws_iam_role.test_role.name}"
    policy_arn = "${aws_iam_policy.flow_test_policy.arn}"
}
```

When attaching flow_test_policy1 on line 79 and the source IP condition is removed, I am able to describe flow logs and also create and delete them attached to the VPC. This can easily be tested by selecting Create Flow Log under the same view and selecting vpc_flow_role under the Role, and main_vpc_log_group as the Destination log group.

_Example of the change to attach flow_test_policy1_
```hcl
resource "aws_iam_role_policy_attachment" "flow_test_attach" {
    role       = "${aws_iam_role.test_role.name}"
    policy_arn = "${aws_iam_policy.flow_test_policy1.arn}"
}
```

_Extra Note_

This also occurs when a policy, without source IP filtering is applied over the top just for the VPC Flow Logs, what makes me think the creation of the flow log requires more than just ec2:CreateFlowLogs