# IAM role for bastion host to access EKS
resource "aws_iam_role" "bastion_role" {
  name = "fendi-bastion-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "fendi-bastion-eks-role"
  }
}

# Attach EKS read policy to bastion role
resource "aws_iam_role_policy_attachment" "bastion_eks_policy" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Instance profile for bastion host
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "fendi-bastion-profile"
  role = aws_iam_role.bastion_role.name
}
