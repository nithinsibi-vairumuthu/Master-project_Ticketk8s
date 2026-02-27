output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "igw_id" {
  value = aws_internet_gateway.igw1.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}