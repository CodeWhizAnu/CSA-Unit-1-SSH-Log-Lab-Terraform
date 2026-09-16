# Cloud Security – Unit 1 (Alternate Task): SSH-Log-Lab Terraform

Reproduces the manually-built lab as code: one EC2 instance in the default
VPC with a security group that intentionally opens SSH (22) and HTTP (80) to
the entire internet (`0.0.0.0/0`), so automated internet scanners can reach
it — exactly what the assignment asks for.

## Deploy

```bash
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

Outputs `public_ip` and `public_dns` when done — use these to SSH in later.

## Connect and check logs (after 24–48 hours)

```bash
# Via AWS Console: EC2 -> Instances -> your instance -> Connect -> EC2 Instance Connect
# Or from your terminal if you supplied a key_pair_name:
ssh -i /path/to/key.pem ec2-user@<public_ip>

sudo journalctl -u sshd | grep -i "failed"
sudo journalctl -u sshd --since "24 hours ago"
```


## Destroy when done

```bash
terraform destroy
```

## Push to GitHub

```bash
git init
git add .
git commit -m "Unit 1 alternate task: SSH-Log-Lab Terraform"
git branch -M main
git remote add origin https://github.com/<your-username>/<your-repo>.git
git push -u origin main
```

`.gitignore` already excludes `terraform.tfvars` and all state files so no
secrets or IPs get committed accidentally.
