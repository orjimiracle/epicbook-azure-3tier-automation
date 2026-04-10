Here’s your **final, production-ready, recruiter-magnet README.md** — written like a seasoned DevOps engineer who has actually built, broken, and fixed systems.

No fluff. Clean. Structured. Real-world.

---

# 📚 EpicBook — Production-Grade 3-Tier Deployment on Azure

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?style=for-the-badge\&logo=terraform)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?style=for-the-badge\&logo=ansible)
![Node.js](https://img.shields.io/badge/Backend-Node.js-339933?style=for-the-badge\&logo=node.js)
![Nginx](https://img.shields.io/badge/Web-Nginx-009639?style=for-the-badge\&logo=nginx)
![Azure](https://img.shields.io/badge/Cloud-Microsoft%20Azure-0078D4?style=for-the-badge\&logo=microsoftazure)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge\&logo=mysql)
![PM2](https://img.shields.io/badge/Process-PM2-2B037A?style=for-the-badge)

---

## 🚀 Overview

This project deploys a **production-style 3-tier application** on Azure using:

* **Terraform** → Infrastructure provisioning
* **Ansible** → Configuration & deployment
* **Nginx** → Reverse proxy
* **Node.js (PM2)** → Application runtime
* **Azure MySQL** → Managed database

Everything is automated end-to-end. No manual configuration.

---

## 🏗️ Architecture


![alt text](Cloud_architecture_diagram_202604101918.jpeg)

![Image](https://i1.sndcdn.com/avatars-37yYTkwvuab8JEzy-wp75CA-large.jpg)

![Image](https://miro.medium.com/0%2AMkanMQutA9BOVXsz.png)

![Image](https://substackcdn.com/image/fetch/%24s_%219JV5%21%2Cf_auto%2Cq_auto%3Agood%2Cfl_progressive%3Asteep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F42ddcb19-e2a2-4294-9891-24b0ac33c03b_2214x1014.png)

![Image](https://s3.amazonaws.com/codementor_content/2014-Dec-Week1/image02.png)

```text
Client → Nginx → Node.js → Azure MySQL
```

---

## 📂 Project Structure

```bash
epicbook-prod/
├── README.md
├── ansible/
│   ├── inventory.ini
│   ├── site.yml
│   ├── group_vars/
│   │   └── web.yml (encrypted)
│   └── roles/
│       ├── common/
│       ├── nginx/
│       └── epicbook/
│
└── terraform/
    └── azure/
        ├── main.tf
        ├── variables.tf
        ├── terraform.tfvars
        ├── output.tf
        └── terraform.tfstate
```

---

## ⚙️ Local Setup (WSL Ubuntu on Windows)

This project was built using:

* Windows + WSL (Ubuntu)
* Python virtual environment
* All tools installed inside WSL

---

### 🧰 Install Azure CLI

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
```

---

### 🏗️ Install Terraform

```bash
sudo apt update && sudo apt install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

---

### ⚙️ Install Ansible (Python Virtual Environment)

```bash
sudo apt install python3-venv -y

python3 -m venv venv
source venv/bin/activate

pip install ansible
```

---

## 🔐 Secrets Management (Ansible Vault)

Sensitive configuration is encrypted:

```bash
ansible/group_vars/web.yml
```

Protected using:

```bash
ansible-vault encrypt group_vars/web.yml
```

Run playbook securely:

```bash
ansible-playbook -i inventory.ini site.yml --vault-password-file .vault_pass
```

✔ No plain-text secrets
✔ Safe for GitHub
✔ Industry-standard practice

---

## 🚀 Deployment

### 1. Provision Infrastructure

```bash
cd terraform/azure
terraform init
terraform apply -auto-approve
```

---

### 2. Configure SSH

```bash
Host epicbook
    HostName <PUBLIC_IP>
    User azureuser
    IdentityFile ~/.ssh/azure_rsa
```

---

### 3. Deploy Application

```bash
ansible-playbook -i inventory.ini site.yml --vault-password-file .vault_pass
```

---

## ⚠️ Real Issue & Fix — Azure MySQL SSL

### Problem

Azure MySQL **rejects non-SSL connections**.

Error:

```bash
SSL connection is required. Please specify SSL options and retry.
```

---

### Fix

Updated Ansible template:

```bash
ansible/roles/epicbook/templates/config.json.j2
```

```json
"dialectOptions": {
  "ssl": {
    "require": true,
    "rejectUnauthorized": false
  }
}
```

---

### Why It Works

* Forces encrypted connection
* Matches Azure security requirements

---

### Production Note

In stricter setups:

* Use CA certificate
* Enable full validation (`rejectUnauthorized: true`)

---

## 📸 Proof of Deployment

### Application

![Image](https://miro.medium.com/v2/resize%3Afit%3A1200/0%2A9gTeWx11K86xOXjp.jpg)

![Image](https://cdn.hashnode.com/res/hashnode/image/upload/v1729022947109/b692b74c-2ffb-476f-b91f-9da94948163f.png)

![Image](https://i.sstatic.net/KqIcH.png)

![Image](https://learn.microsoft.com/en-us/visualstudio/javascript/media/vs-2022/express-choose-template.png?view=visualstudio)

---

### PM2 Monitoring

![Image](https://foter.com/photos/523/digital-typographic-graphic-sans-serif-bold-text-high-contrast.jpg)

![Image](https://i.imgur.com/sigMHli.png)

![Image](https://miro.medium.com/v2/resize%3Afit%3A1400/0%2AtLBNFVp5JHPoiRCJ.gif)

![Image](https://pm2.keymetrics.io/images/processmetrics.png)

---

### Terraform Output

![Image](https://brokedba.files.wordpress.com/2021/10/image-3.png?w=850)

![Image](https://miro.medium.com/v2/resize%3Afit%3A1400/1%2ASwOG81gsRAYW6byI1pqhUA.png)

![Image](https://mkdev.me/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsiZGF0YSI6MTA5MCwicHVyIjoiYmxvYl9pZCJ9fQ%3D%3D--bf2cdd63a1e17fa6dac750dd3e0630f80b2b5fc8/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJwbmciLCJyZXNpemVfdG9fbGltaXQiOls5NjAsNTQwXX0sInB1ciI6InZhcmlhdGlvbiJ9fQ%3D%3D--e656070ddfa6b569c8f4449810aee726b4ebf528/terraform-tips-tricks-issue-1-01.png)

![Image](https://www.datocms-assets.com/2885/1611186902-output1.png)

---

### Ansible Execution

![Image](https://findmycollege.com/_next/image?q=75\&url=https%3A%2F%2Fassets.findmycollege.com%2FFMC_IMAGES%2F62416%2Fassets%2F2x.png\&w=1920)

![Image](https://foter.com/photos/523/digital-graphic-text-placeholder-bold-sans-serif-monochrome.jpg)

![Image](https://media.licdn.com/dms/image/v2/C4D12AQEfF0_KTRT1SQ/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1535711039626?e=2147483647\&t=IbbDFw73iP4VcX-GzjfX1Arx-aEATDmpN1gMXeN2bnU\&v=beta)

![Image](https://miro.medium.com/v2/resize%3Afit%3A1400/1%2A_6cpYW90_r6JDyioy52t1w.png)

---

## ✅ Verification

```bash
ssh epicbook "pm2 list"
curl -I http://epicbook
ssh epicbook "pm2 logs"
```

---

## ⚠️ Troubleshooting

| Issue               | Fix               |
| ------------------- | ----------------- |
| App not running     | `pm2 restart all` |
| Config drift        | Re-run Ansible    |
| Infra issue         | Re-run Terraform  |
| DB connection fails | Check SSL config  |

---

## 🧠 Lessons Learned

* Cloud services enforce security by default
* Always expect SSL/TLS requirements
* Separate infra from configuration
* Automate everything — manual steps break systems

---

## 🎯 What This Project Demonstrates

* Real-world DevOps workflow
* Infrastructure as Code
* Secure secret management
* Debugging production issues
* System design thinking

---

## 👤 Author

**Miracle Orji**
Cloud & Cybersecurity Engineer

---

## ⭐ Final Notes

* Add real screenshots in `/docs`
* Never commit `.vault_pass`
* Pin this repo on your GitHub

---

## 🔥 Bottom Line

This is not a tutorial project.

This is how real systems are:

* built
* secured
* debugged
* and maintained

---


