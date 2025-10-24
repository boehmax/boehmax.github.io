---
layout: post
title: "How to Start a GitHub Repository for Lab Protocols"
date: 2025-10-24
categories: [lab]
tags: [github, protocol]
excerpt: "Keeping track of your lab protocols is challanging. Git(Hub) can help you with that! Let me show you how..."
math: false  # Enable MathJax for equations
---

# 🧪 How to Start a GitHub Repository for Lab Protocols

## 🧭 Why bother
Creating a GitHub repository for lab protocols helps make your research more **organized, transparent, and reproducible**. Instead of protocols being buried in notebooks or scattered across emails, GitHub keeps everything versioned, searchable, and shareable. You can track updates, collaborate with labmates in real time, and ensure everyone is always using the latest, most accurate procedures. It’s a simple step that saves time, reduces errors, and strengthens your lab’s collective knowledge. [Chen et al. (2025)](https://doi.org/10.1371/journal.pbio.3003029) recently published a very interesting article on that matter.

## ⚙️ What Is Git?

**Git** is a **version control system** — a tool that helps you track and manage changes to files over time. It was originally created by Linus Torvalds (the creator of Linux) to handle large, collaborative coding projects, but it’s just as useful for **any work that evolves through edits and versions**, like lab protocols.

With Git, you can:

- See what changed in each file and who made the change
- Revert to earlier versions if something goes wrong
- Work on new ideas safely in separate “branches”
- Merge updates from different people without losing work

In short, Git keeps your files **organized, traceable, and safe**, no matter how many revisions or collaborators you have. If you want to know more, look [here](https://docs.github.com/en/get-started/using-git/about-git). But it's not required to continue with this little guide.

## 🤔 Why Isn’t Everyone Using It Then?

Despite its advantages, Git and GitHub can seem intimidating at first — especially for people without a programming background. The terminology (like “commits,” “branches,” or “pull requests”) and command-line tools can feel overly technical for researchers who just want to record their protocols. Many labs also rely on familiar tools like Word or shared drives, which feel simpler for quick edits. But once the basics are learned, Git and GitHub offer far more control, collaboration, and long-term reliability than traditional methods — making the initial learning curve well worth it.

Here I want to take your hand and walk you through the process. Step by step. It's not as hard as it sounds!

## Step by step guide

### 1. [Create a GitHub Account](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github)

- Go to [https://github.com](https://github.com)
- Click **Sign up** (if you don’t already have an account)
- Follow the prompts to create your username, password, and verify your email

### 2. [Start a New Repository](https://docs.github.com/en/get-started/start-your-journey/setting-up-your-profile#step-1-create-a-new-repository-for-your-profile-readme)

1. After logging in, click the **“+”** icon in the top-right corner
2. Select **“New repository”**
3. Give your repository a clear name — for example:
```markdown
lab-protocols
```
4. Add a short description, e.g.:
    > A collection of standardized lab protocols for molecular biology experiments.
5. Choose whether to make the repo **Public** (recommended for sharing) or **Private** (if you are unsure, use private, later you can still make it public)
6. Check the box **“Add a README file”** — this will help describe your project
7. Click **Create repository**

### 3. Organize Your Protocols
Structuring your protocols is importnat, and you already have some sort of system going on, even if you don't use git. Here is how an example structure could look like

```markdown
lab-protocols/
│
├── README.md
├── molecular_biology/
│   ├── DNA_extraction.md
│   ├── PCR_protocol.md
│
├── cell_culture/
│   ├── cell_passaging.md
│   ├── transfection_protocol.md
│
└── safety/
    └── waste_disposal.md
```

### 4. Write Your Protocols in Markdown
Now that everything is set up, its time to write/transfer your first protocol in GitHub! When writing protocols use Markdown.

#### ✍️ Why Markdown?

**Markdown** is a simple, text-based format that’s perfect for writing and sharing lab protocols. It uses plain text with lightweight formatting (like `#` for headings or `**bold**` for emphasis), which makes it easy to read even without special software.

Markdown files (`.md`) are:

- **Human-readable** — look clean in any text editor
- **Version-friendly** — changes are easy to track with Git
- **Flexible** — can be viewed beautifully on GitHub or converted into PDFs, Word docs, or web pages
- **Future-proof** — since it’s plain text, it won’t become obsolete or tied to a single program

In short, Markdown keeps your protocols **clear, portable, and easy to maintain**.

This is how a small example protocol could look like:
```markdown
# DNA Extraction Protocol

**Objective:** Extract genomic DNA from cultured cells.

## Materials
- Lysis buffer
- Ethanol (70%)
- Nuclease-free water

## Steps
1. Harvest 1×10⁶ cells.
2. Add 200 µL of lysis buffer.
3. Incubate at 56°C for 10 min.
4. Add ethanol, mix, and proceed with spin column purification.

## Notes
- Store extracted DNA at -20°C.

```

Find more information on how to write in markdown [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### 5. Commit and Push Changes

If you’re editing files directly on GitHub, each change is automatically saved as a **commit**.  If you a new to coding and git, this is what I would recommend you to do all of the time. Once you get more familiar with git and GitHub, you can start having your repository locally and push/pull from there. If you feel like you want to give it a try, look [here](https://docs.github.com/en/get-started/git-basics/set-up-git).

### 6. Keep It Updated

- Add new protocols as separate Markdown files in the correct subfolders
- Update existing ones when procedures change
- Use clear commit messages (e.g., “Updated PCR cycle conditions because Hannah told me XYZ which helps with ABC”) 
- Using clear commit messages is crucial to later understand why you change a part of the protocol. This is very powerful! 
- If you document your changes like that it will be easy to change something back once you get another information/insight

### 7. Share and (Optional) Collaborate
Now that you have all your protocols online you can easily share them! The easiest why is to make your repository public. I have printed some QR codes linking to specific protocols and have them glued in the lab. 

And now that they are online, you might be able to motivate your co-workers to help build up more protocols or help you keep them updated. But this is getting quite advanced already, so maybe just an outlook for now:
- Add **collaborators** under **Settings → Collaborators** 
- Use **Issues** to track suggestions or improvements
- Use **Branches** for testing new versions of protocols

## Read more
There are many people already doing the exact thing, so now that you have the basics down, try get inspired by other peoples work! Here are some protocol repositories I found:

- https://github.com/mjmlab/protocols
- https://gallowaylabmit.github.io/protocols/en/latest/ (they went the extra mile and turned it into a web page, but its the same principle)
- https://github.com/boehmax/protocols (my protocols of course)

Don't stress yourself if your layouts are not perfect, or your protocols are not fully complete. It's already great of you that you try it out! Let it grow naturally and revise older layouts and protocols once you are more experienced and have the time for it.

