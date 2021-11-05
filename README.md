# Open Journals :: Compile paper

This action looks for a `paper.md` file in the specified repository and uses it to compile a Open Journals pdf paper.

Under the hood it uses the [publishing-artifacts-action](https://github.com/xuanxu/publishing-artifacts-action) to generate the PDF.

## Usage

Usually this action is used as a step in a workflow that also includes other steps to upload or process the paper after it is generated.

### Inputs

The action accepts the following inputs:

- **repository_url**: Required. The repository URL of the submission containing the paper file.
- **branch**: Optional. Git branch where the paper is located.
- **journal**: Optional. The journal template to use for the paper. Default value is `joss`.

### Outputs

- **pdf_path**: The path to the generated PDF file
- **paper_file_path**: Path to the paper's .md/.tex source file

### Example

Use it adding it as a step in a workflow `.yml` file in your repo's `.github/workflows/` directory and passing your custom input values.

````yaml
on: [workflow_dispatch, push]
jobs:
  compiling:
    runs-on: ubuntu-latest
    steps:
      - name: Compile Paper
        uses: xuanxu/compile-paper-action@main
        with:
          repository_url: http://github.com/${{ github.repository }}
          branch: docs
          journal: joss
```
