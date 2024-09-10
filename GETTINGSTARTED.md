## Tools you need to install

* Flutter Version 3.25
* Flutter doctor should not throw errors or warnings.
* vscode or IDE of choice

## Installation guide



### Adapt the local environment
You only have to execute the command:
```sh
    flutter pub get
```
then run

```sh
    flutter run
```
### Configure the commit standard

All development must follow the commit template:

```bash
# This is the commit standard remember to uncomment the categories where applicable

# feat 🆕:
# fix 🔨:
# chore 🧨:
# docs 📓:
# test 🧪:
# style 🎨:
# refactor 🏗:
# perf 🛠:
# build 🧱:
# ci ⚙️:
# revert ⚠️:
```

The command to be used to enable this template must be documented, namely:

```bash
git config commit.template .gitmessage.conf
```

Remember that once this is done you should not use the git commit -m but **only copy git commit**. This way you will be shown the editor, to add text you must press the letter “i” to insert, you must delete the numeral that implies your change and describe it then press escape (esc) and “:wq” to save the changes or “:qa!” to discard them.

## Authors of the Document
 - Isaac Zapata 9/9/2024
