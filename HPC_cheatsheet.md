# 👷🏼‍♀️ Cheeky Cheat Sheet for those of us not used to using Artemis 

## Checking Slurm jobs currently running 
```bash
squeue -u USERNAME
```
<img width="696" height="78" alt="image" src="https://github.com/user-attachments/assets/50977e53-413e-49fd-8514-b8fef5249d64" />

> I'm not currently running anything

---

## View recently finished jobs
```bash
sacct -u USERNAME --format=JobID,JobName,State,ExitCode,Elapsed | head
```
<img width="562" height="228" alt="image" src="https://github.com/user-attachments/assets/6d693312-20e2-46cf-bb40-806d0f4a71a2" />

---

## Have a look in the work directory/check that nextflow made these directories
 > here I'm just leaving my username in the command 

```bash
find /mnt/nfs2/gdsc/jf383/work -name ".command.run" | head
```
<img width="602" height="226" alt="image" src="https://github.com/user-attachments/assets/4c4edb82-a9b0-40b8-a514-721a45c103ae" />


---

## Inspect my horrendous work directory 
Nextflow creates a work directory (the bane of my existence on the personal linux because it makes _a lot_ of files

Let's have a peak under the hood!
<img width="379" height="817" alt="image" src="https://github.com/user-attachments/assets/4480c7f2-b9d5-4bc6-aa06-4e5b22ea5936" />

