output "publicsubnets" {
  value = aws_subnet.splunk_subnet_public.*.id
}

output "public_subnet_CIDRs" {
  value = aws_subnet.splunk_subnet_public.*.cidr_block
}

output "privatesubnets" {
  value = aws_subnet.splunk_subnet_private.*.id
}

output "private_subnet_CIDRs" {
  value = aws_subnet.splunk_subnet_private.*.cidr_block
}


output "splunk_vpc" {
  value = aws_vpc.splunkvpc.id
}

output "user_subnet" {
  value = aws_subnet.splunk_user_subnet.id
}

output "user_subnet_cidr" {
  value = aws_subnet.splunk_user_subnet.cidr_block
}

output "private_route_table_id" {
  value = aws_route_table.splunk_route_table_private.id
}