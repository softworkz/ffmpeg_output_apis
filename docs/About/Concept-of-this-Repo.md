# Concept of this Repo

This repository uses a pattern for working with development documentation in GitHub repositories that I had developed some time ago to ease the process of writting and reading documentation on GitHub and locally, and is used in various project since then.


## Motivation

### GitHub Wikis

Wikis on GitHub are nice in presentation for reading documentation content and allow creation of a nice TOC in the sidebar.
But Wikis are awful in writing, maintaining and publishing, especially when preferring to work locally, and the Wiki documents are totally unrelated to the actual repo content.
Developer documentation should be part of the source code, so it can grow and evolve together and get updated alongside the code itself.

### GitHub Repo Files

For file content, GitHub repos provide a rendered preview for individual Markdown files but no way to nicely view and navigate all documentation content in a consistent and structured way.    
Though, for repo files, there's the well-known and powerful, collaboration-friendly system of Git and GitHub PRs for managing content and content contributions.


## Concept

The idea is to combine the above in a way to get the benefits of both sides:

- Documentation is stored, written and maintained in the repo as regular file content
- On each push, a GitHub Action runs which publishes the documentation to the Wiki (with some extra processing)
- This allows:
  - Writing documentation in the repository
    (convenient and in-sync with the code)
  - Reading documentation on the Wiki
    (nice-to-read, integrated and close to the code)


## Writing Docs

### Markdown Files

The documentation files are located in the [./docs folder of the repo] and subfolders.

The start page is <../Home.md>. Documents can be added to the root folders or subfolders, but just 1-level deep. New subfolders can be created.

New documents should be added to `./docs/_Sidebar.md` (if applicable), from which the sidebar in the GitHub Wiki is generated.


> [!NOTE]
> The page title on the Wiki is determined by the file name, esentially by replacing dashes with space chars. The L1 headings in the markdown documents are just for reference when working with the files, but when publishing to the Wiki, the first line of all documents will be removed, to avoid duplicate headings on the Wiki.

### Images

All images **MUST** be placed in the [./docs/images](../images)` folder.


### Editing in Visual Studio

To make the documentation files available for editing inside Visual Studio, I have created a "do-nothing" project.

This is located at [./docs/Docs.shproj](../Docs.shproj)

It is essentially a .net "Shared Project", which doesn't do much at all, and I have removed even those few bits (MSBuild imports) and added something custom instead for enabling the right project system behaviors regarding file management.
The project has no build targets, so it doesn't engage in any way during the build process and can be added to any solution, if desired.


#### Editor

The latest VS has support for MarkDown editing (behind a feature flag), but this one is still better:

https://marketplace.visualstudio.com/items?itemName=MadsKristensen.MarkdownEditor2

The docs folder also has a CSS file included which the above editor will pick up and give you more reasonable font sizes, typography and spacing.

### Editing in other Tools

Of course there are many options, but another very good and integrated one is IntelliJ IDEA (free variant available: Android Studio).  
It needs an extra extension installed for MarkDown editing and (at the time of writing), the preview only works when changing the JDK runtime of the IDE (not your projects).



## The Wiki Publishing Process

The publishing to the GitHub Wiki is implemented as a GitHub Action: [Publish Wiki](../../.github/workflows/publish-wiki.yml). Here's a brief description of the individual steps:

### Checkout

Checks out the HEAD of master

### Move all files to root folder

This needs to be done because GitHub Wikis don't properly support a folder tree structure. It works partially, but links and images get screwed. But maintaining docs in a folder structure is useful and so the compromise is to have a tree structure in the repo which gets flattened on publishing.

> [!IMPORTANT]
> Due to this GitHub limitation, it is not possible to have multiple doc files with the same name in different folders. Each doc files needs to have a unique name.

### Delete unwanted files

The doc folders contain a number of files which we don't want or need in the Wiki. This task is deleting those files before publishing

### Stripping file extensions

Another bummer with GH Wikis is that they don't resolve links which include the file extension (.md), even though the Wikis are creating new pages as files with .md extension like everybody else. But when it comes to linking, the links MUST NOT include the file extension - otherwise they just don't work.

That's what [the original GH action](https://github.com/impresscms-dev/strip-markdown-extensions-from-links-action) is doing.

But as we need to flatten the hierarchy, it's not sufficient to remove the .md extension, we also need to fix all the internal links (hyperlinks and image source links) for the hierarchy change.

[My fork of that action](https://github.com/impresscms-dev/strip-markdown-extensions-from-links-action) adds those capabilities. It also applies some beautification to the sidebar as the default rendering creates very small text for the links.

### Copy images to wiki/wiki folder

There seems to be a bug currently where the sidebar is getting confused regarding its base URL and it sometimes (certain back-navigation scenarios) requests the images from a wrong url where the 'wiki/' part is duplicated. 
The quick workaround was to copy the images (which are flattened into the root folder as well) in a subfolder named wiki.

### Stripped Action Steps

Additional actions like automatic creation of links to the source code (from symbol names prefixed with '@' in the documentation text) have been removed for the public version.

### Publish to Wiki Repo 

This is handled by another action 'Andrew-Chen-Wang/github-wiki-action@v4.4.0'. The repo is located here: https://github.com/Andrew-Chen-Wang/github-wiki-action


