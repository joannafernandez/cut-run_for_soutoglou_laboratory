# 🧬 Cut&RUN Analysis Pipeline — Soutoglou Laboratory 
# SET UP

This README includes the required software, installation steps, and pipeline commands used for Cut&RUN NGS library analysis in the Soutoglou Laboratory.

Please note this .md describes configuration for _a personal linux_, and would not be supported by HPC

---

## 📚 Documentation

- **Nextflow** — Workflow management  
  https://www.nextflow.io/docs/latest/overview.html

- **Docker** — Containerization (for local Linux usage)  
  https://www.nextflow.io/docs/latest/developer-env.html

> 💡 On HPC clusters running **Singularity**, Docker is not needed.

---

## 🖥️ How I installed Nextflow on Tony Carr's Linux Machine

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version
curl -s https://get.nextflow.io | bash
sudo mv ~/Desktop/nextflow /usr/local/bin/
nextflow -v
```
## 🐳 Docker Setup (Local Linux)
You will need Docker if running locally on Tony’s Linux system.

> 💡 On HPC systems using **Singularity**, you do **not** need Docker.

---

### ✅ Install Docker Engine

```bash
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Add GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up stable Docker repo
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker packages
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```
✅ Check installation:
```bash
sudo systemctl status docker
sudo docker run hello-world
```
🔓 Optional: Allow running without sudo
```bash
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```
> ✅ You must **log out and log back in** after adding your user to the Docker group

---

### 🧩 nf-core Setup
> ⚠️ **Do not use Conda **as a -profile for nf-core pipelines — use Docker instead.
Create environment
```bash
conda create -n nfcore python=3.10 -y
conda activate nfcore
pip install nf-core
```
✅ Test
```bash
nf-core list
nextflow -v
# Expect:
# > nextflow version 25.04.2
```

---

### 🚦 Running nf-core/cutandrun
Download the correct pipeline release
```bash
nextflow pull nf-core/cutandrun -r 3.2.2
```

Test minimal run
```bash
nextflow run nf-core/cutandrun -r 3.2.2 -profile test,docker

```


