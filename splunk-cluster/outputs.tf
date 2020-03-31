output "splunk" {
  value = aws_instance.splunk.id[count.index]
}

output "splunk_az" {
  value = aws_instance.splunk.availability_zone[count.index]
}

output "splunk_ip" {
  value = aws_instance.splunk.associate_public_ip_address[count.index]
}

output "cloudwatch_group" {
  value = aws_cloudwatch_log_group.log_group.name
}

output "splunk_ec2_instance_role"{
  value = aws_iam_role.splunk_ec2_role.arn
}

output "splunk_shc_alb" {
  value = aws_alb.splunk_shc_alb.dns_name
}