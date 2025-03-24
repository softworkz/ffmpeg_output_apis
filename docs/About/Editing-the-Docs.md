# Editing the Docs

# Motivation

I wanted to find a nice way for writing and sharing documentation with low overhead and close integration. GitHub Wikis are nice in presentation and especially in the way how they are integrated on the GitHub site, but they are awful in writing, maintaining and publishing and the documents there are totally unrelated to the actual repo contents. Developer documentation should be part of the source code, so they can grow and evolve together with the code itself.But unfortunately there's no nice presentation for reading and navigating those on GitHub. I also didn't want to set up another website just for this, and GH pages can't be private anyway (only for enterprise accounts).  
 This led me to the following setup:

- Documentation is stored, written and maintained in the repo
- On each push, a GitHub Action runs which publishes the documentation to the Wiki (with some extra processing)
- This allows:
  - Writing documentation in the repository
    (convenient and in-sync with the code)
  - Reading documentation on the Wiki
    (nice-to-read, integrated and close to the code)

# Writing Docs

## Markdown Files

The documentation files are located in the [./docs folder of the repo] and subfolders.

The start page is <../Home.md>. Documents can be added to the root folders or subfolders, but just 1-level deep. New subfolders can be created.

New documents should be added to `./docs/_Sidebar.md` (if applicable), from which the sidebar in the GitHub Wiki is generated.


> [!NOTE]
> The page title on the Wiki is determined by the file name, esentially by replacing dashes with space chars. The L1 headings in the markdown documents are just for reference when working with the files, but when publishing to the Wiki, the first line of all documents will be removed, to avoid duplicate headings on the Wiki.

## Images

All images MUST be placed in the [./docs/images](../images)` folder.


## Editing in Visual Studio

To make the documentation files available for editing inside VS I have set up a "do-nothing" project.

### Docs Project

This is located at [./docs/Docs.shproj](../Docs.shproj)

It is essentially a .net "Shared Project", which doesn't do much at all, and I have removed even those few bits (MSBuild imports) and added something custom instead for enabling the right project system behaviors regarding file management.
The custom props and targets files are located here in the repo:

- [./docs/.docpro/DocProj.props](../.docproj/DocProj.props)
- [./docs/.docpro/DocProj.targets](../.docproj/DocProj.targets)

The project has no build targets, so it doesn't engage in any way during the build process.


### Editor

The latest VS has support for MarkDown editing (behind a feature flag), but this one is still better:

https://marketplace.visualstudio.com/items?itemName=MadsKristensen.MarkdownEditor2


The docs folder also has a CSS file included which the above editor will pick up and give you more reasonable font sizes, typography and spacing.

# The Wiki Publishing Process

The publishing to the GitHub Wiki is implemented as a GitHub Action: [Publish Wiki](../../.github/orkflows/publish-wiki.yml). Here's a brief description of the individual steps:

#### Checkout

Checks out the HEAD of master

#### Move all files to root folder

This needs to be done because GitHub Wikis don't properly support a folder tree structure. It works partially, but links and images get screwed. But maintaining docs in a folder structure is useful and so the compromise is to have a tree structure in the repo which gets flattened on publishing.

> [!IMPORTANT]
> Due to this GitHub limitation, it is not possible to have multiple doc files with the same name in different folders. Each doc files needs to have a unique name.

#### Delete unwanted files

The doc folders contain a number of files (like .pptx and .xls/xlsm) which we don't want or need in the Wiki. This task is deleting those files before publishing

#### Stripping file extensions

Another bummer with GH Wikis is that they don't resolve links which include the file extension (.md), even though the Wikis are creating new pages as files with .md extension like everybody else. But when it comes to linking, the links MUST NOT include the file extension - otherwise they just don't work.

That's what [the original GH action](https://github.com/impresscms-dev/strip-markdown-extensions-from-links-action) is doing.

But as we need to flatten the hierarchy, it's not sufficient to remove the .md extension, we also need to fix all the internal links (hyperlinks and image source links) for the hierarchy change.

[My fork of that action](https://github.com/impresscms-dev/strip-markdown-extensions-from-links-action) adds those capabilities. It also does some beautification to the sidebar.

#### Copy images to wiki/wiki folder

There seems to be a bug right currently where the sidebar is getting confused regarding its base URL and it sometimes (certain back-navigation scenarios) requests the images from a wrong url where the 'wiki/' part is duplicated. 
The quick workaround wes to copy the images (which are flattened into the root folder as well) in a subfolder named wiki.


#### Publish to Wiki Repo 

This is handled by another action 'Andrew-Chen-Wang/github-wiki-action@v4.4.0'. The repo is located here: https://github.com/Andrew-Chen-Wang/github-wiki-action


