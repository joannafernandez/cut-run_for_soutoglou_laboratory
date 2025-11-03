# 📎 Links to other useful resources
Information on retrieving fastq files from basespace, and moving files into suitable directory for nfcore cutandrun samplesheets

---
## 💻 Brief introduction to CLI 
> https://www.w3schools.com/whatis/whatis_cli.asp

---

## 🔬 If users independelty run their Illumina NextSeq1000 run from their personal BaseSpace accounts
> https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-overview

*Note that the following will only work if basespace is installed and called from a personal linux.

#### ✅ Step 1: install
```bash
$ wget "https://launch.basespace.illumina.com/CLI/latest/amd64-linux/bs" -O $HOME/bin/bs
$ chmod u+x $HOME/bin/bs
```

#### 🔓 Step 2: authenticate and verify
```bash
$ bs auth
$ bs whoami
```

#### ⬇️ Step 3: list and download
```bash
bs project list
```
find relevant project id and create output directory
```bash
basespace download project -i <i> -o <'/path/to/project/output'>
```
move files out of containers 
```bash
find /path/to/project/output/  -name "*.fastq.gz" -exec mv {} /path/to/project/output/
```
---


