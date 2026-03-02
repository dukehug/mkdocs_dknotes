### About this repositorie
- These are my notes from the major IT courses at Adamson University.
- The content may not be perfect, so feel free to open an Issue or submit a PR if you find anything that needs correction.

### Why I publish my notes
- For reviwer
- Notes and Knowlege sharing
- Improve my writing skills
- Use Gemini to help me learning (Gemini can acess my notes)


## Run it on Local

Step  1 : clone project and  create a environment 

```shell
git clone https://github.com/dukehug/mkdocs_dknotes.git

cd mkdocs_dknotes

python3 -m venv notes_venv

```

Step 2 : Activate  environment 

```shell
#activate
source notes_venv/bin/activate

#deactivate
deactivate
```

Step 3: Install requester 

```shell
pip install mkdocs-meterial mkdocs-glightbox mkdocs-mermaid2-plguin -y

#check installed
pip list
```


Step 4: Running

```shell
mkdocs  serve --dev-addr=0.0.0.0:8000
```

